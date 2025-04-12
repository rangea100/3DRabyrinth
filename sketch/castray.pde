boolean direwall = false;
float castRay(float startX, float startY, float angle) {
    float stepSize = 0.01;  // レイの進む細かさ
    float maxDistance = width + height; // 最大探索距離
    float x = startX;
    float y = startY;
    startwall = false;
    goalwall = false;
    direwall = false;
    // 角度をラジアンに変換
    float dx = cos(angle) * stepSize;
    float dy = sin(angle) * stepSize;

    for (float d = 0; d < maxDistance; d += stepSize) {
        x += dx;
        y -= dy;

        // グリッド座標に変換
        int gridX = int(x / cellSize);
        int gridY = int(y / cellSize);

        // 迷路の範囲外なら終了
        if (gridX < 0 || gridX >= cols || gridY < 0 || gridY >= rows) {
            return maxDistance; // 無限遠扱い
        }

        // 壁に当たったら距離を返す
        if (grid[gridX][gridY] == 0) {
            float hitX = x % cellSize;
            float hitY = y % cellSize;

            if (abs(hitX - cellSize / 2) > abs(hitY - cellSize / 2)) {
                direwall = true; // 縦の壁
            } else {
                direwall = false; // 横の壁
            }
            return dist(startX, startY, x, y);
        }
        if (grid[gridX][gridY] == 2) {
            startwall = true;
            return dist(startX, startY, x, y);
        }
        if (grid[gridX][gridY] == 3) {
            goalwall = true;
            return dist(startX, startY, x, y);
        }
    }

    return maxDistance; // もし壁が見つからなければ最大距離を返す
}