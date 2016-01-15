<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- HTML5 shim for IE8 support of HTML5 elements -->
<!--[if lt IE 9]> <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script> <![endif]-->
<link href="${AdminStatics}/simpleboot/themes/flat/theme.min.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/css/simplebootadmin.css" rel="stylesheet">
<link href="${AdminStatics}/js/artDialog/skins/default.css" rel="stylesheet">
<link href="${AdminStatics}/simpleboot/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">


<style>
.length_3 {
	width: 180px;
}
</style>
<!--[if IE 7]> <link rel="stylesheet" href="/statics/simpleboot/font-awesome/4.2.0/css/font-awesome-ie7.min.css"> <![endif]-->
<script type="text/javascript">//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "statics/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${AdminStatics}/js/jquery.js"></script>
<script src="${AdminStatics}/js/wind.js"></script>
<script src="${AdminStatics}/simpleboot/bootstrap/js/bootstrap.min.js"></script>
<script src="${AdminStatics}/js/ajaxForm.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/artDialog/artDialog.js" type="text/javascript"></script>
<script src="${AdminStatics}/js/datePicker/datePicker.js" type="text/javascript"></script>
<link href="${AdminStatics}/js/datePicker/style.css" rel="stylesheet">



<body class="J_scroll_fixed">
	
	<ul class="nav nav-tabs">
		<li class="active"><a href="/admin_post/recyclebin.html">文章回收</a></li>
	</ul>
	<div class="wrap J_check_wrap">
		<form class="well form-search" method="post"
			action="/admin_post/recyclebin.html">
			<div class="search_type cc mb10">
				<div class="mb10">
					<span class="mr20">分类： <select class="select_2" name="term">
							<option value='0'>全部</option>
							<option value='1'>新闻中心</option>
							<option value='2'>发现</option>
					</select> &nbsp;&nbsp;时间： <input type="text" name="start_time"
						class="input length_2 J_date" value="" style="width: 80px;"
						autocomplete="off">-<input type="text"
						class="input length_2 J_date" name="end_time" value=""
						style="width: 80px;" autocomplete="off"> &nbsp; &nbsp;关键字： <input
						type="text" class="input length_2" name="keyword"
						style="width: 200px;" value="" placeholder="请输入关键字..."> <input
						type="submit" class="btn" value="搜索" />
					</span>
				</div>
			</div>
		</form>
		<form class="J_ajaxForm" action="" method="post">
			<div class="table_list">
				<table width="100%" class="table table-hover">
					<thead>
						<tr>
							<th width="16"><label><input type="checkbox" class="J_check_all"
									data-direction="x" data-checklist="J_check_x"></label></th>
							<th width="100">ID</th>
							<th>标题</th>
							<!-- <th>点击量</th> -->
							<th width="80">发布人</th>
							<th width="120"><span>发布时间</span></th>
							<th width="140">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
				</table>
				<div class="pagination"></div>
			</div>
			<div class="form-actions">
				<label class="checkbox inline" for="check_all"><input
					type="checkbox" class="J_check_all" data-direction="y"
					data-checklist="J_check_y" id="check_all">全选</label>
				<button class="btn J_ajax_submit_btn btn-primary" type="submit"
					data-action="/admin_post/clean.html" data-subcheck="true"
					data-msg="你确定删除吗？">删除</button>
			</div>
		</form>
	</div>
	<script src="statics/js/common.js"></script>
	<script>function refersh_window() {
    var refersh_time = getCookie('refersh_time');
    if (refersh_time == 1) {
        window.location.reload();
    }
}
setInterval(function(){
	refersh_window();
}, 2000);
$(function () {
	setCookie("refersh_time",0);
    Wind.use('ajaxForm','artDialog','iframeTools', function () {
        //批量移动
        $('#J_Content_remove').click(function (e) {
            var str = 0;
            var id = tag = '';
            $("input[name='ids[]']").each(function () {
                if ($(this).attr('checked')) {
                    str = 1;
                    id += tag + $(this).val();
                    tag = ',';
                }
            });
            if (str == 0) {
				art.dialog.through({
					id:'error',
					icon: 'error',
					content: '您没有勾选信息，无法进行操作！',
					cancelVal: '关闭',
					cancel: true
				});
                return false;
            }
            var $this = $(this);
            art.dialog.open("/admin_post/move.html&ids=" + id, {
                title: "批量移动"
            });
        });
    });
});

</script>
<div id="calroot"
		style="display: none; position: absolute; top: 133px; left: 187.2px;">
		<div id="calhead">
			<a id="calprev"></a>
			<div id="caltitle">
				<select id="calmonth"><option selected="selected" value="0">一月</option>
					<option value="1">二月</option>
					<option value="2">三月</option>
					<option value="3">四月</option>
					<option value="4">五月</option>
					<option value="5">六月</option>
					<option value="6">七月</option>
					<option value="7">八月</option>
					<option value="8">九月</option>
					<option value="9">十月</option>
					<option value="10">十一月</option>
					<option value="11">十二月</option></select><select id="calyear"><option>1815</option>
					<option>1816</option>
					<option>1817</option>
					<option>1818</option>
					<option>1819</option>
					<option>1820</option>
					<option>1821</option>
					<option>1822</option>
					<option>1823</option>
					<option>1824</option>
					<option>1825</option>
					<option>1826</option>
					<option>1827</option>
					<option>1828</option>
					<option>1829</option>
					<option>1830</option>
					<option>1831</option>
					<option>1832</option>
					<option>1833</option>
					<option>1834</option>
					<option>1835</option>
					<option>1836</option>
					<option>1837</option>
					<option>1838</option>
					<option>1839</option>
					<option>1840</option>
					<option>1841</option>
					<option>1842</option>
					<option>1843</option>
					<option>1844</option>
					<option>1845</option>
					<option>1846</option>
					<option>1847</option>
					<option>1848</option>
					<option>1849</option>
					<option>1850</option>
					<option>1851</option>
					<option>1852</option>
					<option>1853</option>
					<option>1854</option>
					<option>1855</option>
					<option>1856</option>
					<option>1857</option>
					<option>1858</option>
					<option>1859</option>
					<option>1860</option>
					<option>1861</option>
					<option>1862</option>
					<option>1863</option>
					<option>1864</option>
					<option>1865</option>
					<option>1866</option>
					<option>1867</option>
					<option>1868</option>
					<option>1869</option>
					<option>1870</option>
					<option>1871</option>
					<option>1872</option>
					<option>1873</option>
					<option>1874</option>
					<option>1875</option>
					<option>1876</option>
					<option>1877</option>
					<option>1878</option>
					<option>1879</option>
					<option>1880</option>
					<option>1881</option>
					<option>1882</option>
					<option>1883</option>
					<option>1884</option>
					<option>1885</option>
					<option>1886</option>
					<option>1887</option>
					<option>1888</option>
					<option>1889</option>
					<option>1890</option>
					<option>1891</option>
					<option>1892</option>
					<option>1893</option>
					<option>1894</option>
					<option>1895</option>
					<option>1896</option>
					<option>1897</option>
					<option>1898</option>
					<option>1899</option>
					<option>1900</option>
					<option>1901</option>
					<option>1902</option>
					<option>1903</option>
					<option>1904</option>
					<option>1905</option>
					<option>1906</option>
					<option>1907</option>
					<option>1908</option>
					<option>1909</option>
					<option>1910</option>
					<option>1911</option>
					<option>1912</option>
					<option>1913</option>
					<option>1914</option>
					<option>1915</option>
					<option>1916</option>
					<option>1917</option>
					<option>1918</option>
					<option>1919</option>
					<option>1920</option>
					<option>1921</option>
					<option>1922</option>
					<option>1923</option>
					<option>1924</option>
					<option>1925</option>
					<option>1926</option>
					<option>1927</option>
					<option>1928</option>
					<option>1929</option>
					<option>1930</option>
					<option>1931</option>
					<option>1932</option>
					<option>1933</option>
					<option>1934</option>
					<option>1935</option>
					<option>1936</option>
					<option>1937</option>
					<option>1938</option>
					<option>1939</option>
					<option>1940</option>
					<option>1941</option>
					<option>1942</option>
					<option>1943</option>
					<option>1944</option>
					<option>1945</option>
					<option>1946</option>
					<option>1947</option>
					<option>1948</option>
					<option>1949</option>
					<option>1950</option>
					<option>1951</option>
					<option>1952</option>
					<option>1953</option>
					<option>1954</option>
					<option>1955</option>
					<option>1956</option>
					<option>1957</option>
					<option>1958</option>
					<option>1959</option>
					<option>1960</option>
					<option>1961</option>
					<option>1962</option>
					<option>1963</option>
					<option>1964</option>
					<option>1965</option>
					<option>1966</option>
					<option>1967</option>
					<option>1968</option>
					<option>1969</option>
					<option>1970</option>
					<option>1971</option>
					<option>1972</option>
					<option>1973</option>
					<option>1974</option>
					<option>1975</option>
					<option>1976</option>
					<option>1977</option>
					<option>1978</option>
					<option>1979</option>
					<option>1980</option>
					<option>1981</option>
					<option>1982</option>
					<option>1983</option>
					<option>1984</option>
					<option>1985</option>
					<option>1986</option>
					<option>1987</option>
					<option>1988</option>
					<option>1989</option>
					<option>1990</option>
					<option>1991</option>
					<option>1992</option>
					<option>1993</option>
					<option>1994</option>
					<option>1995</option>
					<option>1996</option>
					<option>1997</option>
					<option>1998</option>
					<option>1999</option>
					<option>2000</option>
					<option>2001</option>
					<option>2002</option>
					<option>2003</option>
					<option>2004</option>
					<option>2005</option>
					<option>2006</option>
					<option>2007</option>
					<option>2008</option>
					<option>2009</option>
					<option>2010</option>
					<option>2011</option>
					<option>2012</option>
					<option>2013</option>
					<option>2014</option>
					<option selected="selected">2015</option>
					<option>2016</option>
					<option>2017</option>
					<option>2018</option>
					<option>2019</option>
					<option>2020</option>
					<option>2021</option>
					<option>2022</option>
					<option>2023</option>
					<option>2024</option>
					<option>2025</option>
					<option>2026</option>
					<option>2027</option>
					<option>2028</option>
					<option>2029</option>
					<option>2030</option>
					<option>2031</option>
					<option>2032</option>
					<option>2033</option>
					<option>2034</option>
					<option>2035</option>
					<option>2036</option>
					<option>2037</option>
					<option>2038</option>
					<option>2039</option>
					<option>2040</option>
					<option>2041</option>
					<option>2042</option>
					<option>2043</option>
					<option>2044</option>
					<option>2045</option>
					<option>2046</option>
					<option>2047</option>
					<option>2048</option>
					<option>2049</option>
					<option>2050</option>
					<option>2051</option>
					<option>2052</option>
					<option>2053</option>
					<option>2054</option>
					<option>2055</option>
					<option>2056</option>
					<option>2057</option>
					<option>2058</option>
					<option>2059</option>
					<option>2060</option>
					<option>2061</option>
					<option>2062</option>
					<option>2063</option>
					<option>2064</option>
					<option>2065</option>
					<option>2066</option>
					<option>2067</option>
					<option>2068</option>
					<option>2069</option>
					<option>2070</option>
					<option>2071</option>
					<option>2072</option>
					<option>2073</option>
					<option>2074</option>
					<option>2075</option>
					<option>2076</option>
					<option>2077</option>
					<option>2078</option>
					<option>2079</option>
					<option>2080</option>
					<option>2081</option>
					<option>2082</option>
					<option>2083</option>
					<option>2084</option>
					<option>2085</option>
					<option>2086</option>
					<option>2087</option>
					<option>2088</option>
					<option>2089</option>
					<option>2090</option>
					<option>2091</option>
					<option>2092</option>
					<option>2093</option>
					<option>2094</option>
					<option>2095</option>
					<option>2096</option>
					<option>2097</option>
					<option>2098</option>
					<option>2099</option>
					<option>2100</option>
					<option>2101</option>
					<option>2102</option>
					<option>2103</option>
					<option>2104</option>
					<option>2105</option>
					<option>2106</option>
					<option>2107</option>
					<option>2108</option>
					<option>2109</option>
					<option>2110</option>
					<option>2111</option>
					<option>2112</option>
					<option>2113</option>
					<option>2114</option>
					<option>2115</option>
					<option>2116</option>
					<option>2117</option>
					<option>2118</option>
					<option>2119</option>
					<option>2120</option>
					<option>2121</option>
					<option>2122</option>
					<option>2123</option>
					<option>2124</option>
					<option>2125</option>
					<option>2126</option>
					<option>2127</option>
					<option>2128</option>
					<option>2129</option>
					<option>2130</option>
					<option>2131</option>
					<option>2132</option>
					<option>2133</option>
					<option>2134</option>
					<option>2135</option>
					<option>2136</option>
					<option>2137</option>
					<option>2138</option>
					<option>2139</option>
					<option>2140</option>
					<option>2141</option>
					<option>2142</option>
					<option>2143</option>
					<option>2144</option>
					<option>2145</option>
					<option>2146</option>
					<option>2147</option>
					<option>2148</option>
					<option>2149</option>
					<option>2150</option>
					<option>2151</option>
					<option>2152</option>
					<option>2153</option>
					<option>2154</option>
					<option>2155</option>
					<option>2156</option>
					<option>2157</option>
					<option>2158</option>
					<option>2159</option>
					<option>2160</option>
					<option>2161</option>
					<option>2162</option>
					<option>2163</option>
					<option>2164</option>
					<option>2165</option>
					<option>2166</option>
					<option>2167</option>
					<option>2168</option>
					<option>2169</option>
					<option>2170</option>
					<option>2171</option>
					<option>2172</option>
					<option>2173</option>
					<option>2174</option>
					<option>2175</option>
					<option>2176</option>
					<option>2177</option>
					<option>2178</option>
					<option>2179</option>
					<option>2180</option>
					<option>2181</option>
					<option>2182</option>
					<option>2183</option>
					<option>2184</option>
					<option>2185</option>
					<option>2186</option>
					<option>2187</option>
					<option>2188</option>
					<option>2189</option>
					<option>2190</option>
					<option>2191</option>
					<option>2192</option>
					<option>2193</option>
					<option>2194</option>
					<option>2195</option>
					<option>2196</option>
					<option>2197</option>
					<option>2198</option>
					<option>2199</option>
					<option>2200</option>
					<option>2201</option>
					<option>2202</option>
					<option>2203</option>
					<option>2204</option>
					<option>2205</option>
					<option>2206</option>
					<option>2207</option>
					<option>2208</option>
					<option>2209</option>
					<option>2210</option>
					<option>2211</option>
					<option>2212</option>
					<option>2213</option>
					<option>2214</option></select>
			</div>
			<a id="calnext"></a>
		</div>
		<div id="calbody">
			<div id="caldays">
				<span>日</span><span>一</span><span>二</span><span>三</span><span>四</span><span>五</span><span>六</span>
			</div>
			<div id="calweeks">
				<div class="calweek">
					<a href="#28" class="caloff">28</a><a href="#29" class="caloff">29</a><a
						href="#30" class="caloff">30</a><a href="#31" class="caloff">31</a><a
						href="#1">1</a><a href="#2">2</a><a href="#3">3</a>
				</div>
				<div class="calweek">
					<a href="#4">4</a><a href="#5">5</a><a href="#6">6</a><a href="#7">7</a><a
						href="#8">8</a><a href="#9">9</a><a href="#10">10</a>
				</div>
				<div class="calweek">
					<a href="#11">11</a><a href="#12">12</a><a href="#13">13</a><a
						href="#14">14</a><a href="#15">15</a><a href="#16">16</a><a
						href="#17">17</a>
				</div>
				<div class="calweek">
					<a href="#18">18</a><a href="#19">19</a><a href="#20">20</a><a
						href="#21">21</a><a href="#22">22</a><a href="#23">23</a><a
						href="#24">24</a>
				</div>
				<div class="calweek">
					<a href="#25">25</a><a href="#26">26</a><a href="#27">27</a><a
						href="#28">28</a><a href="#29" class="calfocus" id="calcurrent">29</a><a
						href="#30">30</a><a href="#31">31</a>
				</div>
				<div class="calweek">
					<a href="#1" class="caloff">1</a><a href="#2" class="caloff">2</a><a
						href="#3" class="caloff">3</a><a href="#4" class="caloff">4</a><a
						href="#5" class="caloff">5</a><a href="#6" class="caloff">6</a><a
						href="#7" class="caloff">7</a>
				</div>
			</div>
			<div style="display: none;" class="caltime">
				<button type="button" class="btn btn_submit fr" name="submit">确认</button>
				<input id="calHour" class="input" min="0" max="23" size="2"
					value="0" type="number"><span>点</span><input id="calMin"
					class="input" size="2" min="1" max="59" value="0" type="number"><span>分</span>
			</div>
		</div>
	</div>
</body>
</html>