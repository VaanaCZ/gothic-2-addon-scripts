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
			B_LogEntry 			(TOPIC_Addon_Ornament,"Ich habe den Mechanismus des Steinkreises in der Nähe von Sekobs Hof aktiviert. Es gab einen grossen Knall und ein Steinwächter trachtete mir nach dem Leben."); 
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
			B_LogEntry 			(TOPIC_Addon_Ornament,"Ich habe den Mechanismus des Steinkreises bei Lobarts Hof aktiviert. Mehr als ein Beben hat es dabei allerdings nicht gegeben."); 
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
			B_LogEntry 			(TOPIC_Addon_Ornament,"Ich habe den Mechanismus des Steinkreises im nördlichen Wald aktiviert. Ein grosser Steinwächter erschien. Er hatte eine echt miese Laune."); 
			ORNAMENT_SWITCHED_FOREST = TRUE;
		};
};

