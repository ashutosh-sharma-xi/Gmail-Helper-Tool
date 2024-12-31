#!/usr/bin/env python3

import aws_cdk as cdk

from motion_stream.motion_stream_stack import MotionStreamStack


app = cdk.App()
MotionStreamStack(app, "MotionStreamStack")

app.synth()
