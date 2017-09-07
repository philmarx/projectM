localStorage.setItem('pageMaxSize',10);
window.photoUrlPrefix='http://tomeet-app-files.oss-cn-hangzhou.aliyuncs.com/user/';
window.photoUrlSuffix='?x-oss-process=image/resize,m_lfit,w_200,h_200';


function dateTimeFormat(dateNum){
	function repair(minute){
		var str=minute+'';
		if(str.length===1){
			str='0'+str;
		}
		return str;
	}
	var date=new Date(dateNum);
	var dateString=date.getFullYear()+'-'+repair((date.getMonth()+1))+'-'+repair(date.getDate())+' '+date.getHours()+':'+repair(date.getMinutes())+':'+repair(date.getSeconds());
	return dateString;
}

String.prototype.trim=function(){
     return this.replace(/(^\s*)|(\s*$)/g, '');
}

function stringToDate(fDate){  
    var fullDate = fDate.split("-");  
    return new Date(fullDate[0], fullDate[1]-1, fullDate[2], 0, 0, 0);  
} 