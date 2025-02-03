package main
import rl "vendor:raylib"

SCREEN_WIDTH :: 800
SCREEN_HEIGHT :: 450

camera := rl.Camera3D {
	position   = rl.Vector3{10.0, 10.0, 10.0},
	target     = rl.Vector3{0.0, 0.0, 0.0},
	up         = rl.Vector3{0.0, 1.0, 0.0},
	fovy       = 45.0,
	projection = rl.CameraProjection.PERSPECTIVE,
}

main :: proc() {
	init()
	defer deinit()
	for !rl.WindowShouldClose() {
		update()
		draw()
	}
}

init :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Hello Odin!")
	rl.SetTargetFPS(60)
}

deinit :: proc() {
	rl.CloseWindow()
}

update :: proc() {
	rl.UpdateCamera(&camera, rl.CameraMode.ORBITAL)
}

draw :: proc() {
	rl.BeginDrawing()
	defer rl.EndDrawing()
	rl.ClearBackground(rl.RAYWHITE)
	rl.BeginMode3D(camera)
	defer rl.EndMode3D()
	rl.DrawPlane(rl.Vector3{0.0, 0.0, 0.0}, rl.Vector2{10.0, 10.0}, rl.LIGHTGRAY)
	rl.DrawCube(rl.Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl.RED)
	rl.DrawCubeWires(rl.Vector3{0.0, 1.0, 0.0}, 2.0, 2.0, 2.0, rl.DARKGRAY)
	rl.DrawGrid(10, 1.0)
	rl.DrawFPS(10, 10)
}
