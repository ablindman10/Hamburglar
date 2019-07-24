

timer.Simple( 5, function() --spawn ham_bugerler
  local ham_bugerler = ents.Create( "npc_monk" )
  if ( !IsValid( ham_bugerler ) ) then return end // Check whether we successfully made an entity, if not - bail
  ham_bugerler:SetPos( Vector(-1515.633423, -2403.137939, -195.968750) )
  ham_bugerler:Spawn()
  ham_bugerler:SetNPCState( -1 ) --shut him the hell up




  --player tries to sell interaction
  hook.Add( "PlayerUse", "sell", function( ply, ent )
    --print(ent:GetModel()
    if(ent:GetModel() == "models/monk.mdl") then


        ply.darkRPPocket = ply.darkRPPocket or {} -- need this if inv is empty

        --loop through and remove hamburgers
        for k in pairs(ply.darkRPPocket) do
          if(ply.darkRPPocket[k].Class == "sent_ham") then
            ply:removePocketItem(k)
            ply:addMoney(1000)
            ply:PrintMessage( HUD_PRINTTALK, "Added $1000")
          end
        end
    end
  end )
end )
