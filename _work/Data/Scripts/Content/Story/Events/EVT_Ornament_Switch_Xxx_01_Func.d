//****************************
// 	EVT_ORNAMENT_SWITCH_BIGFARM_01_FUNC (Ornamentschalterrätsel beim Steinkreis Onars Hof) //ADDON
//****************************
func void EVT_ORNAMENT_SWITCH_BIGFARM_01_FUNC ()
{
		if (ORNAMENT_SWITCHED_BIGFARM == FALSE)
		{
			Wld_InsertNpc	(Stoneguardian_Ornament		 		,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01"); 
			Wld_InsertItem	(ItMi_OrnamentEffekt_BIGFARM_Addon	 ,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_BIGFARM_01");  
			Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",  ItMi_OrnamentEffekt_BIGFARM_Addon, ItMi_OrnamentEffekt_BIGFARM_Addon, 0, 0, 0, FALSE );
			Snd_Play 	("Ravens_Earthquake4" );
			Snd_Play 	("Ravens_Earthquake2" );
			Snd_Play 	("THRILLJINGLE_02" );
			Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  ItMi_OrnamentEffekt_BIGFARM_Addon, ItMi_OrnamentEffekt_BIGFARM_Addon, 0, 0, 0, FALSE );
			Log_CreateTopic 	(TOPIC_Addon_Ornament, LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_Addon_Ornament, LOG_RUNNING);
			B_LogEntry 			(TOPIC_Addon_Ornament,"Spustil jsem mechanismus kamenného kruhu u Sekobova statku. Byla to rána jak z dęla a vzápętí se mę pokusila zabít nęjaká kamenná potvora."); 
			ORNAMENT_SWITCHED_BIGFARM = TRUE;
		};
};

//****************************
// 	EVT_ORNAMENT_SWITCH_FARM_01_FUNC (Ornamentschalterrätsel beim Steinkreis Lobarts Hof) //ADDON
//****************************
func void EVT_ORNAMENT_SWITCH_FARM_01_FUNC ()
{
		if (ORNAMENT_SWITCHED_FARM == FALSE)
		{
			Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
			Log_CreateTopic 	(TOPIC_Addon_Ornament, LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_Addon_Ornament, LOG_RUNNING);
			B_LogEntry 			(TOPIC_Addon_Ornament,"Aktivoval jsem mechanismus kamenného kruhu u Lobartova statku. Zemę se zatâásla, ale nic jiného se nestalo."); 
			ORNAMENT_SWITCHED_FARM = TRUE;
		};
};

//****************************
// 	EVT_ORNAMENT_SWITCH_FOREST_01_FUNC (Ornamentschalterrätsel beim Steinkreis im Medium Forest) //ADDON
//****************************
func void EVT_ORNAMENT_SWITCH_FOREST_01_FUNC ()
{
		if (ORNAMENT_SWITCHED_FOREST == FALSE)
		{
			Wld_InsertNpc	(Stoneguardian_Ornament		 		,"FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");  
			Wld_InsertItem	(ItMi_OrnamentEffekt_FOREST_Addon	 ,"FP_EVENT_STONEGUARDIAN_ORNAMENT_EFFECT_FOREST_01"); 
			Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
			Wld_PlayEffect("spellFX_INCOVATION_WHITE",  ItMi_OrnamentEffekt_FOREST_Addon, ItMi_OrnamentEffekt_FOREST_Addon, 0, 0, 0, FALSE );
			Snd_Play 	("Ravens_Earthquake4" );
			Snd_Play 	("Ravens_Earthquake2" );
			Snd_Play 	("THRILLJINGLE_02" );
			Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",  ItMi_OrnamentEffekt_FOREST_Addon, ItMi_OrnamentEffekt_FOREST_Addon, 0, 0, 0, FALSE );
			Log_CreateTopic 	(TOPIC_Addon_Ornament, LOG_MISSION);
			Log_SetTopicStatus	(TOPIC_Addon_Ornament, LOG_RUNNING);
			B_LogEntry 			(TOPIC_Addon_Ornament,"Aktivoval jsem mechanismus kamenného kruhu v lese na severu. Objevil se kamenný strážce a nebyl v nijak dobré náladę."); 
			ORNAMENT_SWITCHED_FOREST = TRUE;
		};
};

