const std = @import("std");
const io = std.Io;
const File = std.Io.File;
const Writer = std.Io.Writer;

pub fn main() void {
    var buffer: [10]u8 = undefined;

    // is there a <= ?
    for (0..10) |i| {
        buffer[i] = @as(u8, @intCast(i))  + 1;
        std.debug.print("Buffer[{d}]= {d} \n", .{i, buffer[i]});
    }
    var buffer: [64]u8 = undefined;
    std.debug.print("Cancer: {any} \n", .{buffer});

    const writer: Writer = std.Io.File.writerStreaming(file: File, io: Io, buffer: []u8)



    std.Io.Writer.print(writer, "Something", .{});
}
