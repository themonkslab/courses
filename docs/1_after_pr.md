# 🧙 After PR

_Made with love by the_ **Monkslab** ❤️

## Wise, targeted and valuable solutions

- [x] 1. git checkout main
- [x] 2. git pull to main branch
- [x] 3. delete remaining local branchs
- [x] 4. follow [Trunk Base Version Control](https://www.atlassian.com/continuous-delivery/continuous-integration/trunk-based-development) and create new branch.
  - [x] 1. Think of the problem to solve and:
    - [x] a. choose the minimum solution that adds more value aligned with business,
    - [x] b. take the story card and plan from end to beginning, research, look code. Every note or thought you make, leave it on the card: will be useful in the future.
    - [x] c. start from the smallest and bottomnest part and move to top
    - [x] d. if you still think that is what adds more value, continue to 2; if not, repeat from 1.
  - [x] 2. name the new branch as follows:
    - **fix**: patches bug in your codebase => **patch** in semantic versioning.
    - **feat**: introduces a new feature to the codebase => **minor** in semantic versioning.
    - use # automated reference to epic tickets: **feat/multiple-bill-payments-#1234**
  - [x] 3. create **feature flag** if the feature is not ready for production
