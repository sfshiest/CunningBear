({
    clickCreatecampingitem: function(component, event, helper) {
        
        // Simplistic error checking
        var validCampingItem = true;
            console.log("1");
        // Name must not be blank
        var nameField = component.find("itname");
        var itname = nameField.get("v.value");
        if ($A.util.isEmpty(itname)){
            validCampingItem = false;
            nameField.set("v.errors", [{message:"Camping Item name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
            console.log("2");
        
        // Quantity must not be blank
        var quantityField = component.find("quantity");
        var quantity = quantityField.get("v.value");
        if ($A.util.isEmpty(quantity)){
            validCampingItem = false;
            quantityField.set("v.errors", [{message:"Camping Item quantity can't be blank."}]);
        }
        else {
            quantityField.set("v.errors", null);
        }
            console.log("3");
        
        // Price must not be blank
        var priceField = component.find("price");
        var price = priceField.get("v.value");
        if ($A.util.isEmpty(price)){
            validCampingItem = false;
            priceField.set("v.errors", [{message:"Camping Item price can't be blank."}]);
        }
        else {
            priceField.set("v.errors", null);
        }
            console.log("4");
        
        // If we pass error checking, do some real work
        if(validCampingItem){
            // Create the new camping item
            var newItem = component.get("v.newItem");
            console.log("Create camping item: " + JSON.stringify(newItem));
            
            var theItems = component.get("v.items");
            
            // Copy the item to a new object
            // THIS IS A DISGUSTING, TEMPORARY HACK
            var newnewItem = JSON.parse(JSON.stringify(newItem));
            
            console.log("Item before 'create': " + JSON.stringify(theItems));
            theItems.push(newnewItem);
            component.set("v.items", theItems);
            console.log("Item after 'create': " + JSON.stringify(theItems));    
            
            var emptyItem = { 'sobjectType': 'Camping_Item__c',
                             'Name': '',
                             'Quantity__c': 0,
                             'Price__c': 0,
                             };
            component.set("v.newItem", emptyItem);
        }
    }
})