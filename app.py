#!/usr/bin/env python3
import aws_cdk as cdk
import os
import json
from motion_stream.motion_stream_stack import MotionStreamStack

app = cdk.App()

# context works with CDK CLI, but not running from an IDE
context_name = os.getenv("CDK_DEFAULT_CONTEXT", "staging")
context = app.node.try_get_context(context_name)

if not context:
    with open("./cdk.json") as f:
        cdk_json = json.load(f)
        context = cdk_json["context"][context_name]

MotionStreamStack(app, 
                  "MotionStreamStack",
                  context["iot_thing1"],
                  context['iot_thing1_attributes'],
                  env=cdk.Environment(account=os.getenv('CDK_DEFAULT_ACCOUNT'), 
                                      region=os.getenv('CDK_DEFAULT_REGION'))
                  )

app.synth()
