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


    // reading input from the console
    // var text: [300]u8 = undefined;
    var readBuffer: [64]u8 = undefined;

    const stdin = File.stdin();
    var stdinReader = stdin.readerStreaming(io, &readBuffer);
    // returns usize of read buffer
    // values are saved into the buffer
    const us = try stdinReader.interface.streamDelimiterEnding(&stdoutWriter.interface, '\n');
    std.debug.print("What: {any} \n", .{stdinReader.interface.buffer});

    std.debug.print("What we read: {any}\n", .{stdinReader.getSize()});
    std.debug.print("Size: {any}\n", .{us});
    const stringRead = stdinReader.interface.buffer.ptr[0..us];

    std.debug.print("What we got: {s}\n", .{stringRead});
    std.debug.print("Type: {any}\n", .{@TypeOf(stringRead)});
}
