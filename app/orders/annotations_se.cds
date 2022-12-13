using orderservice as service from '../../srv/service';

annotate service.Orders @(Common : {
    SideEffects #CustomerChanged : {
        SourceProperties : ['customer_ID'],
        TargetProperties : ['address'],
        TargetEntities   : [
            customer,
            customer.addresses
        ]
    },
    SideEffects #ItemChanged     : {
        SourceEntities   : [items],
        TargetProperties : [
            'totamount',
            'currency_code'
        ]

    }
});

annotate service.OrderItems @(Common : {
    SideEffects #ProductChanged  : {
        SourceProperties : ['product_id'],
        TargetProperties : [
            'price',
            'currency_code',
            'netprice'
        ]
    },
    SideEffects #QuantityChanged : {
        SourceProperties : ['quantity'],
        TargetProperties : ['netprice']
    }

});
