#!/bin/sh

message="";

git add .

#2 > GitFormatError.txt

echo ""
echo "  欢迎使用gitCommit格式化工具"
echo ""
echo "    (0) Feat:新功能（feature）"
echo "    (1) Fix :修补bug"
echo "    (2) Docs:文档相关更新（documentation）"
echo "    (3) Style:代码格式变化（不影响运行）"
echo "    (4) Refactor:重构（既不新增也不修复bug）"
echo "    (5) Perf:提高性能"
echo "    (6) Test:测试相关更新"
echo "    (7) Chore:构建过程或辅助工具的变动"
echo "    (8) Cleanup:不影响代码逻辑的提交"
echo "    (9) Tracking:跟踪相关提交"
echo ""

typeArray=("Feat" "Fix" "Docs" "Style" "Refactor" "Perf" "Test" "Chore" "Cleanup" "Tracking")

inputType(){

	stype=0;

	read -p "  选择 Commit 类型 (0):" stype

	if [[ $stype =~ ^-?[0-9]+$ && $stype -lt ${#typeArray[@]} ]] #&& $stype -lt ${#typeArray}
	then
		typee="${typeArray[$stype]}"
		message="${message}${typeArray[$stype]}"
	elif [[ $stype == "" ]]
	then
		typee="${typeArray[0]}"
		message="${message}${typeArray[0]}"
	else
	 	echo "  [Error] 参数错误"
	 	inputType
	fi
}

inputType
echo "  TYPE:${typee}"

inputScope(){

	scopee=""

	read -p "  输入这次 Commit 的影响范围 (空):" scopee

	if [[ ${#scopee} -gt 0 ]]
	then
		scopee="(${scopee})"
		message="${message}${scopee}:"
	else
		message="${message}:"
	fi
}

inputScope
echo "  SCOPE:${scopee}"

inputSubject(){

	subject=""

	read -p "  简单描述这次 Commit (空):" subject

	if [[ ${#subject} -gt 0 && $(( ${#message} + ${#subject} )) -lt 100 ]]
	then
		message="${message} ${subject}"
	else
		echo "  [Error] 没有描述或描述过长"
		inputSubject
	fi
}

inputSubject
echo "  SUBJECCT:${subject}"

inputBody(){

	body=""

	read -p "  输入 Commit 正文 (空):" body

	if [[ ${#body} -gt 0 ]]
	then
		message="${message}\n\n${body}"
	fi
}

inputBody
echo "  BODY:${body}"

genModifiedFileList(){
	
	diff="${git diff --name-only}"


	if [[ ${#diff} -gt "" ]]
	then
		message="${message}\n\n${diff}"
	fi
}

# genModifiedFileList
# echo "  DIFF:${diff}"

message="${message}"

text=$(echo -e "$message")

echo ""

git commit -m "${text}"
