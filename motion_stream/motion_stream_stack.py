from constructs import Construct
from aws_cdk import (
    Duration,
    Stack,
    aws_iam as iam,
    aws_sqs as sqs,
    aws_sns as sns,
    aws_sns_subscriptions as subs,
    aws_iot as iot
)

class MotionStreamStack(Stack):

    def __init__(self,
                 scope: Construct,
                 construct_id: str,
                 iot_gps_thing:str,
                 iot_gps_thing_attributes:dict,
                 **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)
        
        ################# GPS THING ####################
        gps_thing = iot.CfnThing(self, "MotionStreamIot",
            attribute_payload=iot.CfnThing.AttributePayloadProperty(
                attributes=iot_gps_thing_attributes
            ),
            thing_name=iot_gps_thing
        )
        
        

        
        

