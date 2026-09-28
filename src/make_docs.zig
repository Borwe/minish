const std = @import("std");
const Io = std.Io;

pub fn main(init: std.process.Init) !void{
    const alloc = init.gpa;
    defer alloc.deinit();

    const args = try init.minimal.args.toSlice(alloc);
    defer alloc.free(args);

    try Io.Dir.createDirPath(
        try Io.Dir.openDirAbsolute(init.io, args[1]),
        "docs");
}
