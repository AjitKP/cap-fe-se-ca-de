using orderservice as service from '../../srv/service';

annotate service.Orders with @(UI.Identification : [
    {
        $Type         : 'UI.DataFieldForAction',
        Label         : 'Set to In Process',
        Action        : 'orderservice.setOrderProcessing',
        ![@UI.Hidden] : {$edmJson : {$Ne : [
            {$Path : 'status'},
            'Open'
        ]}}
    },
    {
        $Type         : 'UI.DataFieldForAction',
        Label         : 'Set to Open',
        Action        : 'orderservice.setOrderOpen',
        ![@UI.Hidden] : {$edmJson : {$Eq : [
            {$Path : 'status'},
            'Open'
        ]}}
    }
]);
