local MODEL_ID = 1337

addEventHandler("onClientResourceStart", resourceRoot,
function()

    -- Load textures
    local txd = engineLoadTXD("westwood.txd")
    engineImportTXD(txd, MODEL_ID)

    -- Load collision
    local col = engineLoadCOL("westwood.col")
    engineReplaceCOL(col, MODEL_ID)

    -- Load model
    local dff = engineLoadDFF("westwood.dff", MODEL_ID)
    engineReplaceModel(dff, MODEL_ID)

    -- Increase draw distance
    engineSetModelLODDistance(MODEL_ID, 5000)

    -- Create object
    local obj = createObject(MODEL_ID, 0, 0, 5)

    -- Optional: make interior/dimension explicit
    setElementInterior(obj, 0)
    setElementDimension(obj, 0)

    outputDebugString("Westwood map loaded!")

end)