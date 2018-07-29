# GitCommitFormatter

Format to: 

```
type(scope): subject

body

footer
```

Use `./GitCommitFormatter.sh` instead `git commit -m "message"`

You can choose commit type:

	    (0) feat:新功能（feature）"
	    (1) fix :修补bug"
	    (2) docs:文档相关更新（documentation）"
	    (3) style:代码格式变化（不影响运行）"
	    (4) refactor:重构（既不新增也不修复bug）"
	    (5) perf:提高性能"
	    (6) test:测试相关更新"
	    (7) chore:构建过程或辅助工具的变动"
	    (8) cleanup:不影响代码逻辑的提交"
	    (9) tracking:跟踪相关提交"

