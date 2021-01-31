# This file is a part of JetBot.jl, licensed under the MIT License (MIT).

__precompile__(true)

"""
    JetBot

NVIDIA JetBot control from Julia
"""
module JetBot

using BaremetalPi
using ImageIO
using Images
using VideoIO


include("motors.jl")
include("cameras.jl")
include("hid.jl")

include("precompile.jl")

end # module
