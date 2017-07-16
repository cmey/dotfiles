# auto reload edited files
@schedule begin
    sleep(0.1)
    @eval using Revise
end

# fix GR.jl: "Launching GKSTerm failed."
@schedule begin
    sleep(0.1)
    @eval gkstermpath = joinpath(Pkg.dir("GR"), "deps/gr/Applications/GKSTerm.app")
    @eval run(`open $gkstermpath`)
end
