var request;
var flagSelect;// 标记当前选择
// 创建request对象
if (window.XMLHttpRequest) {
	request = new XMLHttpRequest;
} else {
	request = new ActiveXObject("Microsoft.XMLHTTP");
}
// 联动查询
function initST(flag, value) {
	flagSelect = flag;
	var path = "personalIndex_getST?flag=" + flag + " && value=" + value;
	request.onreadystatechange = setValue;
	request.open("get", path, true);
	request.send();
}
// 为select框设置值
function setValue() {

	if (request.status == 200 && request.readyState == 4) {
		if (flagSelect == "1")// 选择学院则更新专业与老师
		{
			update(document.getElementById("secondType"));
			document.getElementById("thirdType").innerHTML="";
		}
		if (flagSelect == "2")// 选择专业则更新老师
		{
			update(document.getElementById("thirdType"));
		}
	}
}

// 更新数据
function update(obj) {
	var opt=obj.options;
	// 先清空原来的数据
	obj.innerHTML="";
   
	var value=  eval("(" + request.responseText + ")");
	
	//value=value.substring(1,value.length-1).split(',');
	for ( var i = 0; i < value.length; i++) {
		// 创建一个option并添加到下拉框
		var o = document.createElement("option");
		o.value = value[i];
		o.text = value[i];
		opt.add(o);

	}
}