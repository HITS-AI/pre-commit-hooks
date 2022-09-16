## pre-commit

`.pre-commit-config.yaml`에 아래와 같은 방식으로 선언하여 pre-commit 훅을 사용할 수 있습니다.

```yaml
default_install_hook_types:
  - pre-commit
  - prepare-commit-msg
  - ...
repos:
  - repo: https://github.com/HITS-AI/pre-commit-hooks
    rev: d0236e2
    hooks:
      - id: add-jira-issue-key-to-commit-msg
        # args: ["--key", "HITS"] # 기본 키는 ONE 입니다.
```

## ID

### `add-jira-issue-key-to-commit-msg`

`<이슈 키> = <프로젝트 키>-<이슈 번호>`

브랜치명이 `<이슈 키>-<제목>`형식으로 선언되어 있으면 커밋 메시지를 자동으로 `<이슈 키>: <커밋 메시지>`로 변환해주는 훅입니다.

`["--key", "PROJECTKEY"]` args를 선언하여 프로젝트 키를 변경할 수 있습니다. 기본은 ONE입니다.
