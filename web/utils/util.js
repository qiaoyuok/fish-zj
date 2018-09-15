// 分割字符串
function split(str){
  return str.split(",");
}

// 分割字符串取分
function split1(str) {
  return str.split(":")[1];
}

// 分割字符串取时
function split2(str) {
  return str.split(":")[0];
}

// 把十进制转换为16进制
function trans(num){
  return num.toString(16);
}

function decodeBase64 (strIn) {
  if (!strIn.length || strIn.length % 4)
    return null;
  var str64 =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  var index64 = [];
  for (var i = 0; i < str64.length; i++)
    index64[str64.charAt(i)] = i;
  var c0, c1, c2, c3, b0, b1, b2;
  var len = strIn.length;
  var len1 = len;
  if (strIn.charAt(len - 1) == '=')
    len1 -= 4;
  var result = [];
  for (var i = 0, j = 0; i < len1; i += 4) {
    c0 = index64[strIn.charAt(i)];
    c1 = index64[strIn.charAt(i + 1)];
    c2 = index64[strIn.charAt(i + 2)];
    c3 = index64[strIn.charAt(i + 3)];
    b0 = (c0 << 2) | (c1 >> 4);
    b1 = (c1 << 4) | (c2 >> 2);
    b2 = (c2 << 6) | c3;
    result.push(b0 & 0xff);
    result.push(b1 & 0xff);
    result.push(b2 & 0xff);
  }
  if (len1 != len) {
    c0 = index64[strIn.charAt(i)];
    c1 = index64[strIn.charAt(i + 1)];
    c2 = strIn.charAt(i + 2);
    b0 = (c0 << 2) | (c1 >> 4);
    result.push(b0 & 0xff);
    if (c2 != '=') {
      c2 = index64[c2];
      b1 = (c1 << 4) | (c2 >> 2);
      result.push(b1 & 0xff);
    }
  }
  return result;
}

function base64_encode(str){ // 编码，配合encodeURIComponent使用
  var c1, c2, c3;
  var base64EncodeChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
  var i = 0, len = str.length, strin = '';
  while (i < len) {
    c1 = str.charCodeAt(i++) & 0xff;
    if (i == len) {
      strin += base64EncodeChars.charAt(c1 >> 2);
      strin += base64EncodeChars.charAt((c1 & 0x3) << 4);
      strin += "==";
      break;
    }
    c2 = str.charCodeAt(i++);
    if (i == len) {
      strin += base64EncodeChars.charAt(c1 >> 2);
      strin += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
      strin += base64EncodeChars.charAt((c2 & 0xF) << 2);
      strin += "=";
      break;
    }
    c3 = str.charCodeAt(i++);
    strin += base64EncodeChars.charAt(c1 >> 2);
    strin += base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
    strin += base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >> 6));
    strin += base64EncodeChars.charAt(c3 & 0x3F)
  }
  return strin
}

function oneControll (device_id) {//单路控制       
  var command_type = 164;                         //单路控制 A1
  var check_val = command_type + 10 + 10;		//校验
  var end_code = 13;								//结束位
  var str_command = "";
  str_command += String.fromCharCode(command_type);
  str_command += String.fromCharCode(10);
  str_command += String.fromCharCode(10);
  str_command += String.fromCharCode(check_val);
  str_command += String.fromCharCode(end_code);
  return str_command = this.base64_encode(str_command);
}


module.exports.split = split
module.exports.split1 = split1
module.exports.split2 = split2
module.exports.trans = trans
module.exports.decodeBase64 = decodeBase64
module.exports.base64_encode = base64_encode
module.exports.oneControll = oneControll
