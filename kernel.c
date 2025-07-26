void main() {
    char* video = (char*) 0xb8000;
    const char* message = "Welcome to MyOS!";
    for (int i = 0; message[i] != '\0'; i++) {
        video[i * 2] = message[i];    // 字元
        video[i * 2 + 1] = 0x0F;      // 顏色：白底黑字
    }

    while (1);
}
