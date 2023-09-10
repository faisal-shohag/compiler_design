#include <iostream>
#include <vector>
#include <string>

using namespace std;

vector<vector<string>> grammar;

void checkLeftRec(vector<string> &g) {
    vector<string> res;
    for (size_t i = 1; i < g.size(); ++i) {
        if (g[i].find(g[0]) == 0) {
            string p = g[i];
            p.erase(0, g[0].length());
            p += g[0] + "'";
            res.push_back(p);
        }
    }
    if (res.empty()) {
        string res_str = "";
        for (size_t i = 1; i < g.size(); ++i) {
            if (i + 1 != g.size()) {
                res_str += g[i] + "|";
            } else {
                res_str += g[i];
            }
        }
        cout << g[0] << " -> " << res_str << " [No Left Recursion]" << endl;
    } else {
        string res_str = "";
        for (size_t i = 0; i < res.size(); ++i) {
            if (i + 1 != res.size()) {
                res_str += res[i] + "|";
            } else {
                res_str += res[i];
            }
        }
        cout << g[0] << " -> " << res_str << "|" << "ε" << endl;
    }
}

int main() {
    int n;
    cout << "Number of Rules: ";
    cin >> n;
    cin.ignore(); // Clear the newline character from the input buffer

    for (int i = 0; i < n; ++i) {
        string rule;
        getline(cin, rule);
        vector<string> rule_parts;
        size_t arrow_pos = rule.find("->");
        rule_parts.push_back(rule.substr(0, arrow_pos));
        string right_side = rule.substr(arrow_pos + 2);
        size_t pipe_pos;
        while ((pipe_pos = right_side.find('|')) != string::npos) {
            rule_parts.push_back(right_side.substr(0, pipe_pos));
            right_side = right_side.substr(pipe_pos + 1);
        }
        rule_parts.push_back(right_side);
        grammar.push_back(rule_parts);
    }

    cout << "\nResult:" << endl;
    for (size_t i = 0; i < grammar.size(); ++i) {
        checkLeftRec(grammar[i]);
    }

    return 0;
}
