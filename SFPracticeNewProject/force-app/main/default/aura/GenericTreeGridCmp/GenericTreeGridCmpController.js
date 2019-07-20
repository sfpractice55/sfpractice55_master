({
    doInit : function(component, event, helper) {
        
        var action= component.get("c.findHierarchyData");
        var parentFieldName = component.get("v.ltngParentFieldAPIName");
        var fieldList = component.get("v.ltngColumnAPINameList");
        var params={
            "recId"							:component.get("v.ltngcurrentRecId"),
            "parentFieldAPIName"			:component.get("v.ltngParentFieldAPIName"),
            "objectAPIname"					:component.get("v.ltngSobjectName"),
            "columnLabelList"				:component.get("v.ltngColumnLabelList"),
            "fieldAPINameList"				:component.get("v.ltngColumnAPINameList"),
            "hyperlinkColumn"				:component.get("v.ltngHyperlinkColumn")
        };
        if(params){
            action.setParams(params);
        }
        console.log('****param to controller:'+JSON.stringify(params));
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var apexResponse = response.getReturnValue();
                //console.log(JSON.stringify(apexResponse));
                var columns = apexResponse.headerList;
                console.log('***columns:'+JSON.stringify(columns));
                component.set('v.gridColumns', columns);
                var expandedRows = [];
                var hierarchydata = apexResponse.recordList;
                var roles = {};
                console.log('*******hierarchydata:'+JSON.stringify(hierarchydata));
                var results = JSON.stringify(hierarchydata); //hierarchydata;
                roles[undefined] = { Name: "Root", _children: [] };
                hierarchydata.forEach(function(v) {
                    expandedRows.push(v.Id);
                    var recordDetail = {};
                    fieldList.forEach(function(fieldAPIName) {
                        if(fieldAPIName.includes(".")){
                            var fname= fieldAPIName;
                            console.log('***fname : ' + fname);
                            var ss= fname.split(".");
                            console.log('***ss : ' + ss);
                            //console.log('****ss.length:'+ss.length);
                            var tempValue=v[ss[0]];
                            console.log('***tempValue : ' + tempValue);
                            //console.log('****initial tempValue:'+JSON.stringify(tempValue));
                            for(var i=1;i<ss.length;i++){
                                console.log('****tempValue for '+fname+':'+tempValue[ss[i]]);
                                tempValue = tempValue[ss[i]];
                            }   
                            recordDetail[fname]=tempValue;
                        }else{
                            console.log('Index off: ' + fieldAPIName.indexOf('CP~'));                            
                            if(fieldAPIName.indexOf('CP~') >= 0) {
                                var fieldAPINames = fieldAPIName.replace('CP~', '');
                                console.log('****fieldAPINameCP :' + fieldAPINames + '----'+ v[fieldAPINames]); 
                                var mDat = v.getsfpractice__Price_Ceiling__r;
                                console.log('********MyMsg : ' + JSON.stringify(mDat));
                                console.log('*******TestJSON:'+mDat);
                                if(mDat != 'undefined') {
                                for(var i in mDat) {
                                    if(typeof mDat[i]=='object'){
                                        console.log('Yes Attributes : ' + fieldAPINames+ '---' + mDat[i].getsfpractice__CP_Year_1__c);
                                        console.log('****12undefined' + (mDat === 'undefined'));
                                        
                                        if(mDat[i] != 'undefined') {
                                        	recordDetail[fieldAPIName]= '$ '+ mDat[i].getsfpractice__CP_Year_1__c;    
                                        	//recordDetail[fieldAPIName]='sssssss ';    
                                        }                                        
                                        //
                                        //recordDetail[fieldAPIName]=mDat[i].getsfpractice__CP_Year_2__c;
                                    }                                	   
                                }}                                
                                console.log('Price Ceiling $ : ' + JSON.stringify(recordDetail));// + v['getsfpractice__Price_Ceiling__r.Name']);  //v['getsfpractice__Price_Ceiling__r.getsfpractice__CP_Year_1__c']
                            } else {
                                console.log('***fieldAPIName :' + fieldAPIName + '----'+ v[fieldAPIName]);
                        		recordDetail[fieldAPIName]=v[fieldAPIName];  
                                
                            }
                        }
                        
                        
                    });                    
                   
                    
                    recordDetail["Id"]=v["Id"];
                    recordDetail["RecordURL"]= '/'+v["Id"];
                    recordDetail["_children"]= [];
                    console.log('****recordDetail:'+JSON.stringify(recordDetail));
                    roles[v.Id] = recordDetail;
                });
                hierarchydata.forEach(function(v) {
                    console.log('***roless : ' + roles[v["Id"]]);
                    roles[v[parentFieldName]]._children.push(roles[v["Id"]]);   
                });     
                //console.log('******before treegrid data: ' + roles[v.Id]);
                component.set("v.gridData", roles[undefined]._children);
                console.log('*******treegrid data:'+JSON.stringify(roles[undefined]._children));
                component.set('v.gridExpandedRows', expandedRows);
            }else if(state === "ERROR"){
                var errors = response.getError();
                console.error(errors);
                alert('Problem with connection.'+errors);
            }
        });
        $A.enqueueAction(action);
    }
})