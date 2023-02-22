# GitCommitFormatter

Format to: 

```
type(scope): subject

filelist
```

Use `./committer.sh` instead `git commit -m "message"`

You can choose commit type:

	    (0) Feat:新功能（feature）"
	    (1) Fix :修补bug"
	    (2) Docs:文档相关更新（documentation）"
	    (3) Style:代码格式变化（不影响运行）"
	    (4) Refactor:重构（既不新增也不修复bug）"
	    (5) Perf:提高性能"
	    (6) Test:测试相关更新"
	    (7) Chore:构建过程或辅助工具的变动"
	    (8) Cleanup:不影响代码逻辑的提交"
	    (9) Tracking:跟踪相关提交"

