System.register(["./p-d676a04e.system.js"],(function(t){"use strict";var e,i,n;return{setters:[function(t){e=t.r;i=t.c;n=t.h}],execute:function(){var s={en:{Mon:"Mon",Tue:"Tue",Wed:"Wed",Thu:"Thu",Fri:"Fri",Sat:"Sat",Sun:"Sun",AM:"AM",PM:"PM",Jan:"Jan",Feb:"Feb",Mar:"Mar",Apr:"Apr",May:"May",Jun:"Jun",Jul:"Jul",Aug:"Aug",Sep:"Sep",Oct:"Oct",Nov:"Nov",Dec:"Dec"}};var a={Jan:0,Feb:1,Mar:2,Apr:3,May:4,Jun:5,Jul:6,Aug:7,Sep:8,Oct:9,Nov:10,Dec:11};var o=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];var r=["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];function l(t){var e=[];var i=true;var n,s;for(var l=0,d=t;l<d.length;l++){var c=d[l];if(c.date&&c.date.substring(5)&&c.date.substring(5).split(" ").length===3&&a[c.date.substring(5).split(" ")[1]]>-1&&parseInt(c.date.substring(5).split(" ")[2])&&parseInt(c.date.substring(5).split(" ")[0])){var h=new Date(parseInt(c.date.substring(5).split(" ")[2]),a[c.date.substring(5).split(" ")[1]],parseInt(c.date.substring(5).split(" ")[0]));if(!n||n>h)n=h;if(!s||s<h)s=h}else{i=false;break}}if(i&&n&&s){var p={m1:n.getMonth(),y1:n.getFullYear()},m=p.m1,u=p.y1;var g={m2:s.getMonth(),y2:s.getFullYear()},f=g.m2,b=g.y2;do{var v={monthYear:o[m]+" "+u,weeks:[]};var T=[];var S=new Date(u,m,1);var x=new Date(u,m+1,0);for(var w=1;w<=S.getDay();w++){T.push(null)}var G=function(e){var i=new Date(u,m,e);var n=r[i.getDay()]+", "+e+" "+o[m]+" "+u;var s=t.find((function(t){return t.date===n}));T.push({dayOfMonth:e,isEnabled:s?true:false,dateText:n})};for(var y=1;y<=x.getDate();y++){G(y)}for(var k=T.length+1;k<=42;k++){T.push(null)}for(var D=1;D<=6;D++){var M={days:[]};for(var P=1;P<=7;P++){M.days.push(T.shift())}v.weeks.push(M)}e.push(v);if(m===11){m=0;u++}else{m++}}while(u<b||u===b&&m<=f)}return e}function d(t,e){var i=[];var n=t.timeSlots.filter((function(t){var e=true;if(!t)e=false;return e}));if(n.length){var s=e?7:4;var a=n[0].length<=8?4:2;var o=a*s;var r=Math.ceil(n.length/o);if(e&&r>1){s=Math.ceil(n.length/a);r=1}for(var l=1;l<=r;l++){var d={dateText:t.date.substring(5),rows:[]};for(var c=1;c<=s;c++){var h={times:[]};for(var p=1;p<=a;p++){var m=n.shift();h.times.push(m?{timeText:m}:null)}d.rows.push(h)}i.push(d)}}return i}var c=":host{display:block !important}.neo-slot-picker{position:relative !important}.neo-popup{position:absolute !important;z-index:999 !important;background-color:white !important;padding:2px !important;margin:3px 0px !important;-webkit-box-shadow:0 0 10px lightgray !important;box-shadow:0 0 10px lightgray !important;border:1px solid whitesmoke !important}.neo-scroll{max-height:200px !important;overflow-y:overlay !important}.neo-scroll::-webkit-scrollbar{-webkit-appearance:none}.neo-scroll::-webkit-scrollbar:vertical{width:12px}.neo-scroll::-webkit-scrollbar:horizontal{height:12px}.neo-scroll::-webkit-scrollbar-thumb{border-radius:5px;border:3px solid white;background-color:#ed6436}.neo-scroll::-webkit-scrollbar-track{border-radius:10px;background-color:#ffffff}.neo-input{min-width:275px !important;cursor:pointer !important}.neo-paginate,.neo-close,.neo-back{padding:2px 10px !important;cursor:pointer !important;font-size:medium !important;color:#ed6436}.neo-paginate-disabled{color:rgb(189, 189, 189) !important}.neo-table{table-layout:fixed !important;width:100% !important;margin-bottom:0px !important}.weekday{background-color:#ed6436;color:#ffffff}.neo-tr.neo-equal-width>*:nth-last-child(2)~*{width:50% !important}.neo-tr.neo-equal-width>*:nth-last-child(3)~*{width:33.3% !important}.neo-tr.neo-equal-width>*:nth-last-child(4)~*{width:25% !important}.neo-tr.neo-equal-width>*:nth-last-child(5)~*{width:20% !important}.neo-tr.neo-equal-width>*:nth-last-child(6)~*{width:16.7% !important}.neo-tr.neo-equal-width>*:nth-last-child(7)~*{width:14.3% !important}.neo-th,.neo-td{border:1px solid whitesmoke !important;border-collapse:collapse !important}.neo-table{border:1.5px solid whitesmoke !important;border-collapse:collapse !important}.neo-th,.neo-td{padding:3px !important;text-align:center !important;overflow:hidden !important}.neo-right-end{text-align:right !important;width:15% !important}.neo-left-end{text-align:left !important;width:15% !important}.neo-grid{font-size:small !important;min-width:275px !important}.neo-day,.neo-time{padding:2px !important}.neo-cell-enabled{color:black !important}.neo-grid .neo-tr{height:1.75rem !important}@media only screen and (min-width: 768px){.neo-cell-enabled:hover{color:white !important;background-color:#ed6436 !important}}.neo-cell-selected{color:white !important;background-color:#ed6436 !important}.neo-day-enabled,.neo-day-selected,.neo-time-enabled,.neo-time-selected{cursor:pointer !important}.neo-day-disabled{color:lightgray !important;cursor:not-allowed !important}.neo-center{border-right:0px !important;border-left:0px !important}.neo-left-end{border-right:0px !important}.neo-right-end{border-left:0px !important}.neo-empty-grid .neo-th,.neo-empty-grid .neo-td{border:1px solid white !important}.neo-no-slots-text{color:gray !important}";var h=t("datetime_slot_picker",function(){function t(t){e(this,t);this.slotUpdate=i(this,"slotUpdate",7);this.placeholder="Pick a slot";this.timeSlotsText="Time Slot";this.noSlotsText="No slots are available";this.dateFormat="ddd, D MMM YYYY";this.timeFormat="h:mm A";this.slots=[];this.language="en";this.translations=s;this.datesHiddenWhenTimesShown=false}t.prototype.handleClearSlot=function(t){console.log("Clear event",t);this.resetSlot()};t.prototype.handleOnClick=function(t){var e=t&&t.target&&t.target.className&&typeof t.target.className==="string"&&t.target.className.includes("neo-")?true:false;if(!e)this.closeGrid()};t.prototype.componentWillLoad=function(){this.processSlots(this.slots)};t.prototype.processSlots=function(t){if(this.slots){this.isTimeSlotGridVisible=false;this.selectedDate=undefined;this.selectedTime=undefined;this.displayText=undefined;this.dateGrids=l(t);if(this.dateGrids&&this.dateGrids.length)this.activeDateGridPage=0}};t.prototype.setSelectedDate=function(t){var e=this;if(t){this.selectedDate=t;if(this.slots.length&&this.slots[0].timeSlots){if(this.displayText)this.resetSlot();var i=this.slots.find((function(t){return t.date===e.selectedDate}));this.timeGrids=d(i,this.datesHiddenWhenTimesShown);this.selectedTime=undefined;if(this.timeGrids&&this.timeGrids.length)this.activeTimeGridPage=0;this.isTimeSlotGridVisible=true}else this.setSlot()}};t.prototype.setSelectedTime=function(t){if(t){this.selectedTime=t;this.setSlot()}};t.prototype.setSlot=function(){var t,e;if(this.dateFormat==="MM-DD-YYYY"){var i=new Date(this.selectedDate);t=i.getMonth()+1+"-"+i.getDate()+"-"+i.getFullYear()}else{var n=this.selectedDate.split(" ");t=this.getTranslation(n[0].substring(0,n[0].length-1))+", "+n[1]+" "+this.getTranslation(n[2])+" "+n[3]}if(this.selectedTime){e=this.formatTimeSlot(this.selectedTime);e=e.replace(/AM/g,this.getTranslation("AM"));e=e.replace(/PM/g,this.getTranslation("PM"))}this.displayText=t+(this.selectedTime?", "+e:"");this.slotUpdate.emit({date:this.selectedDate,timeSlot:this.selectedTime,translatedDate:t,translatedTimeSlot:e});this.isPopped=false;this.isTimeSlotGridVisible=false};t.prototype.resetSlot=function(){this.displayText=undefined;this.slotUpdate.emit({date:null,timeSlot:null,translatedDate:null,translatedTimeSlot:null})};t.prototype.closeGrid=function(){this.isPopped=false;this.isTimeSlotGridVisible=false;if(!this.displayText){this.selectedDate=undefined;this.selectedTime=undefined}};t.prototype.goBack=function(){this.isTimeSlotGridVisible=false};t.prototype.prevDateGrid=function(){if(this.activeDateGridPage>0)this.activeDateGridPage--};t.prototype.nextDateGrid=function(){if(this.activeDateGridPage<this.dateGrids.length-1)this.activeDateGridPage++};t.prototype.prevTimeGrid=function(){if(this.activeTimeGridPage>0)this.activeTimeGridPage--};t.prototype.nextTimeGrid=function(){if(this.activeTimeGridPage<this.timeGrids.length-1)this.activeTimeGridPage++};t.prototype.getTranslation=function(t){if(this.translations[this.language])return this.translations[this.language][t];else return s["en"][t]};t.prototype.formatTimeSlot=function(t){var e=function(t){var e=t.replace(/ AM/g,"");e=e.replace(/ PM/g,"");if(t.indexOf("AM")>-1){var i=e.split(":")[0].trim();if(i.length===1)i="0"+i;if(i.indexOf("12")===0)i="00";return i+":"+(e.split(":")[1]?e.split(":")[1].trim():"00")}else if(t.indexOf("PM")>-1){var i=e.split(":")[0].trim();if(i.indexOf("12")!==0)i=(parseInt(i)+12).toString();return i+":"+(e.split(":")[1]?e.split(":")[1].trim():"00")}};var i=t;if(this.timeFormat==="HH:mm"){if(t.indexOf("-")>-1){var n=void 0;n=t.split("-");n=n.map((function(t){return e(t)}));i=n[0]+" - "+n[1]}else{i=e(t)}}return i};t.prototype.render=function(){var t=this;var e={bottom:!this.isNeoInputAboveFold?this.neoInputHeight+"px":undefined,left:this.isNeoInputLeftSide?"0px":undefined,right:!this.isNeoInputLeftSide?"0px":undefined};var i;if(this.dateGrids&&this.dateGrids.length>0)i=this.dateGrids[this.activeDateGridPage].monthYear.split(" ");return n("span",{class:"neo-slot-picker"},n("input",{class:"neo-input",type:"text",readonly:true,placeholder:this.placeholder,value:this.displayText,ref:function(e){return t.neoInput=e}}),n("div",{style:e,class:this.isNeoInputAboveFold?"neo-popup neo-popup-below":"neo-popup neo-popup-above"},(!this.isTimeSlotGridVisible||!this.datesHiddenWhenTimesShown)&&this.dateGrids&&this.dateGrids.length>0&&n("table",{class:"neo-table neo-grid neo-date-grid"},n("tr",{class:"neo-tr"},n("th",{class:"neo-th neo-left-end"}),n("th",{colSpan:5,class:"neo-th neo-center"},n("span",{class:this.activeDateGridPage>0?"neo-paginate":"neo-paginate neo-paginate-disabled",onClick:function(){if(t.activeDateGridPage>0)t.prevDateGrid()}},"<"),this.getTranslation(i[0])+" "+i[1],n("span",{class:this.activeDateGridPage<this.dateGrids.length-1?"neo-paginate":"neo-paginate neo-paginate-disabled",onClick:function(){if(t.activeDateGridPage<t.dateGrids.length-1)t.nextDateGrid()}},">")),n("th",{class:"neo-th neo-right-end"},n("span",{class:"neo-close",onClick:function(){return t.closeGrid()}},"×"))),n("tr",{class:"neo-tr neo-equal-width weekday"},n("td",{class:"neo-td"},this.getTranslation("Sun")),n("td",{class:"neo-td"},this.getTranslation("Mon")),n("td",{class:"neo-td"},this.getTranslation("Tue")),n("td",{class:"neo-td"},this.getTranslation("Wed")),n("td",{class:"neo-td"},this.getTranslation("Thu")),n("td",{class:"neo-td"},this.getTranslation("Fri")),n("td",{class:"neo-td"},this.getTranslation("Sat"))),this.dateGrids[this.activeDateGridPage].weeks.map((function(e){return n("tr",{class:"neo-tr neo-equal-width"},e.days.map((function(e){return e?n("td",{class:!e.isEnabled?"neo-td neo-cell neo-cell-disabled":e.dateText==t.selectedDate?"neo-td neo-cell neo-cell-selected":"neo-td neo-cell neo-cell-enabled",onClick:function(){return t.setSelectedDate(e.isEnabled?e.dateText:undefined)}},n("span",{class:!e.isEnabled?"neo-day neo-day-disabled":e.dateText==t.selectedDate?"neo-day neo-day-selected":"neo-day neo-day-enabled"},e.dayOfMonth)):n("td",{class:"neo-td"}," ")})))}))),(!this.isTimeSlotGridVisible||!this.datesHiddenWhenTimesShown)&&this.dateGrids&&!this.dateGrids.length&&n("table",{class:"neo-table neo-grid neo-empty-grid"},n("tr",{class:"neo-tr"},n("th",{class:"neo-th neo-left-end"}),n("th",{colSpan:5,class:"neo-th neo-center"}," "),n("th",{class:"neo-th neo-right-end"},n("span",{class:"neo-close",onClick:function(){return t.closeGrid()}},"×"))),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td neo-no-slots-text"},this.noSlotsText)),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," "))),(this.isTimeSlotGridVisible||!this.datesHiddenWhenTimesShown&&this.selectedDate)&&this.timeGrids&&this.timeGrids.length>0&&n("div",null,this.datesHiddenWhenTimesShown&&n("table",{class:"neo-table neo-grid neo-time-grid"},n("tr",{class:"neo-tr"},n("th",{class:"neo-th neo-left-end"},n("span",{class:"neo-back",onClick:function(){return t.goBack()}},"←")),n("th",{class:"neo-th neo-center",colSpan:6},this.timeSlotsText),n("th",{class:"neo-th neo-right-end"},n("span",{class:"neo-close",onClick:function(){return t.closeGrid()}},"×")))),n("div",{class:this.datesHiddenWhenTimesShown&&this.isTimeSlotGridVisible?" neo-scroll":""},n("table",{class:"neo-table neo-grid neo-time-grid"},this.timeGrids[this.activeTimeGridPage].rows.map((function(e){return n("tr",{class:"neo-tr neo-equal-width"},e.times.map((function(i){var s;if(i){s=t.formatTimeSlot(i.timeText);s=s.replace(/AM/g,t.getTranslation("AM"));s=s.replace(/PM/g,t.getTranslation("PM"))}return i?n("td",{colSpan:e.times.length===2?4:2,class:i.timeText==t.selectedTime?"neo-td neo-cell neo-cell-selected":"neo-td neo-cell neo-cell-enabled",onClick:function(){return t.setSelectedTime(i.timeText)}},n("span",{class:i.timeText==t.selectedTime?"neo-time neo-time-selected":"neo-time neo-time-enabled"},s)):n("td",{colSpan:e.times.length===2?4:2,class:"neo-td"}," ")})))})))),!this.datesHiddenWhenTimesShown&&this.timeGrids&&this.timeGrids.length>0&&n("table",{class:"neo-table neo-grid neo-time-grid"},n("tr",{class:"neo-tr"},n("th",{class:"neo-th neo-left-end"},n("span",null," ")),n("th",{class:"neo-th neo-center",colSpan:6},n("span",{class:this.activeTimeGridPage>0?"neo-paginate":"neo-paginate neo-paginate-disabled",onClick:function(){if(t.activeTimeGridPage>0)t.prevTimeGrid()}},"<"),this.timeSlotsText,n("span",{class:this.activeTimeGridPage<this.timeGrids.length-1?"neo-paginate":"neo-paginate neo-paginate-disabled",onClick:function(){if(t.activeTimeGridPage<t.timeGrids.length-1)t.nextTimeGrid()}},">")),n("th",{class:"neo-th neo-right-end"},n("span",null," "))))),(this.isTimeSlotGridVisible||!this.datesHiddenWhenTimesShown&&this.selectedDate)&&this.timeGrids&&!this.timeGrids.length&&n("table",{class:"neo-table neo-grid neo-empty-grid"},n("tr",{class:"neo-tr"},n("th",{class:"neo-th neo-left-end"},this.datesHiddenWhenTimesShown?n("span",{class:"neo-back",onClick:function(){return t.goBack()}},"←"):n("span",null," ")),n("th",{colSpan:5,class:"neo-th neo-center"}," "),n("th",{class:"neo-th neo-right-end"},this.datesHiddenWhenTimesShown?n("span",{class:"neo-close",onClick:function(){return t.closeGrid()}},"×"):n("span",null," "))),this.datesHiddenWhenTimesShown&&n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td neo-no-slots-text"},this.noSlotsText)),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),this.datesHiddenWhenTimesShown&&n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")),this.datesHiddenWhenTimesShown&&n("tr",{class:"neo-tr"},n("td",{colSpan:7,class:"neo-td"}," ")))))};Object.defineProperty(t,"watchers",{get:function(){return{slots:["processSlots"]}},enumerable:false,configurable:true});return t}());h.style=c}}}));