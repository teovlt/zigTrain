const std = @import("std");
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

fn soutHelloworld() !void {
    std.debug.print("Hello, world!\n", .{});
}

fn askUserInput() !void {
    var buffer: [1024]u8 = undefined;
    const bytesRead = try stdin.readUntilDelimiterOrEof(&buffer, '\n');

    // Vérification que l'entrée n'est pas vide
    if (bytesRead == null) {
        std.debug.print("No input received.\n", .{});
        return;
    }

    // Extraire la valeur de bytesRead
    _ = bytesRead.?; // Utilisation de .? pour extraire la valeur optionnelle

    // Utiliser la longueur obtenue pour découper le tableau correctement
    const input = buffer[0..]; // Découpe en fonction de la taille lue
    try stdout.print("You entered: {s}\n", .{input});
}

pub fn main() !void {
    try askUserInput();
    try soutHelloworld();
}
