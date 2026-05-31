const std = @import("std");
const File = std.Io.File;
const Writer = std.Io.Writer;

pub fn main(init: std.process.Init) !void {
    var buffer: [10]u8 = undefined;

    // is there a <= ?
    for (0..10) |i| {
        buffer[i] = @as(u8, @intCast(i)) + 1;
        std.debug.print("Buffer[{d}]= {d} \n", .{ i, buffer[i] });
    }
    std.debug.print("Cancer: {any} \n", .{buffer});

    var writeBuffer: [64]u8 = undefined;

    const io = init.io;
    const stdout = File.stdout();
    var stdoutWriter = stdout.writerStreaming(io, &writeBuffer);

    try stdoutWriter.interface.print("CANCER \n", .{});
    try stdoutWriter.flush();
}
