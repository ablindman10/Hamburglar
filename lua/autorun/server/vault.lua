

timer.Simple( 5, function()


	local vault = ents.Create( "prop_physics" )
	if ( !IsValid( vault ) ) then return end // Check whether we successfully made an entity, if not - bail
	vault:SetModel( "models/vault/vault.mdl" )
	vault:SetPos( Vector(-1424.640625, -2628.246094, -195.968750) )
	vault:Spawn()



	--bool, if its robable or not
	local is_robable = true

	hook.Add( "PlayerUse", "robing", function( ply, ent )



		--if they use the vault
		if(ent:GetModel() == "models/vault/vault.mdl") then

			--if robable
			if(is_robable) then

				--player pos
				my_pos = ply:GetPos()

				--play alarm sound at play pos
				sound.Play( "ambient/alarms/alarm1.wav", my_pos )

				--no longer robable till time is done
				is_robable = false
				timer.Simple(10, function() is_robable = true end) --robable at end

				--time for player to see how long till robable
				time_end = CurTime() + 10

				--start spawning hamburgers
				timer.Create( "spawn ham", 1, 9, function() local burger = ents.Create( "sent_ham" )
				burger:SetModel( "sent_ham" )


				--need to spawn just above vault
				spawn_pos = ent:GetPos()
				spawn_pos[3] = spawn_pos[3] + 30
				burger:SetPos( spawn_pos )
				burger:Spawn()


				end )


			else
				--tell player how long till robable
				time_left = time_end - CurTime()
				ply:PrintMessage( HUD_PRINTTALK, string.format("Time left: %d seconds", time_left))
			end
		end

	end )

end)
