//****************************
// 	ENTER_DI_FIRSTTIME_TRIGGER 
//****************************
var int EnterDI_Kapitel6;

func void ENTER_DI_FIRSTTIME_TRIGGER ()
{
	//----- Levelchange verbarrikadieren --------
	if (Npc_HasItems (hero,ITKE_SHIP_LEVELCHANGE_MIS))
	{
		Npc_RemoveInvItems	(hero,	ITKE_SHIP_LEVELCHANGE_MIS,1);	//Joly: denn SHIP zen wird bei DRAGONISLAND UND NEWWORLD benutzt. Beim betreten der Insel ist die Tür wieder zu!!!!
	};
	
	
	if (hero.attribute[ATR_DEXTERITY] < 15)//Joly:wegen Brückenevent
	{
		Wld_InsertItem	(ItPo_Perm_DEX, "FP_ITEM_DI_ENTER_05");
	};

//###############################################
//##
//##	B_ENTER_DRAGONISLAND			
//##	//Joly: Steht hier, denn hier bin ich sicher, 
//##	dass alle am start sind und können befüllt werden!
//##
//###############################################

	if (EnterDI_Kapitel6 == FALSE)
		{
		
			if (hero.guild == GIL_PAL)
			{
				CreateInvItems (Archol,ItRu_PalDestroyEvil,1);
			};
		
		Wld_InsertItem	(ItMi_Flask, "FP_ITEM_SHIP_12");
			
		//##############################################################################################################
		//##	"Auge-Innos-zu-Hause-vergessen"-NotfallPlan
		//##############################################################################################################
			if (Npc_HasItems (hero,ItMi_InnosEye_MIS) == FALSE)
				{
					if (Npc_HasItems (hero,ItMi_InnosEye_Discharged_Mis) == FALSE)
					{
						Wld_InsertItem	(ItSe_XardasNotfallBeutel_MIS, "FP_ITEM_SHIP_12");
						SC_InnosEyeVergessen_DI = TRUE;
						B_LogEntry (TOPIC_HallenVonIrdorath,"Letzte Nacht hatte ich einen Traum. Xardas sprach zu mir und bat mich, den Alchemietisch auf dem Schiff aufzusuchen um dort etwas abzuholen. Sehr befremdlich und dabei ich hatte eigentlich gar nichts getrunken letzte Nacht."); 
					};
					Wld_InsertItem	(ItMi_Flask, "FP_ITEM_SHIP_06");
					
					if 	(((Npc_HasItems (hero, ItAt_IcedragonHeart) >= 1)
					|| 	(Npc_HasItems (hero, ItAt_RockdragonHeart)	>= 1)
					|| 	(Npc_HasItems (hero, ItAt_FiredragonHeart)	>= 1)
					|| 	(Npc_HasItems (hero, ItAt_SwampdragonHeart)	>= 1))== FALSE)
						{
							CreateInvItems	(OrkElite_AntiPaladinOrkOberst_DI,	ItAt_RockdragonHeart ,1);
						};	
				};
		//##############################################################################################################
	//Lehrer Logs
	
			Log_CreateTopic (TOPIC_MyCrew, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_MyCrew, LOG_RUNNING);

			//----- Die Kapitäne -----
	
				if ( JorgenIsCaptain == TRUE)	//Jorgen
				{
					Log_AddEntry (TOPIC_MyCrew,"Jorgen, mein Kapitän, wird hier auf dem Schiff warten, bis ich zurück bin."); 
				};
			
				if ( TorlofIsCaptain == TRUE)	//Torlof
				{
					Log_AddEntry (TOPIC_MyCrew,"Torlof, mein Kapitän, wird hier auf dem Schiff bleiben und es verteidigen, so lange ich auf der Insel bin. Bei ihm kann ich meine Geschicklichkeit und Stärke verbessern."); 
				};
			
				if ( JackIsCaptain == TRUE)		//Jack
				{
					Log_AddEntry (TOPIC_MyCrew,"Jack, mein Kapitän, wird hier auf dem Schiff warten, bis ich zurück bin. Er wirkt ein bisschen ängstlich. Hoffentlich legt sich das wieder. Ich brauche ihn."); 
				};
				
			//----- Die Crew -----
				
				if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
				{
					Log_AddEntry (TOPIC_MyCrew,"Lee wird in meiner Abwesenheit, das Kommando auf dem Schiff übernehmen. Bei ihm kann meine Fertigkeiten mit Ein- und Zweihandwaffen verbessern."); 
				};
			
				if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
				{
					Log_AddEntry (TOPIC_MyCrew,"Bei Milten kann ich mein Mana steigern."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Milten kann mir desweiteren das Runenbauen lehren."); 
					};
				};
			
				if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
				{
					Log_AddEntry (TOPIC_MyCrew,"Ich habe den Eindruck, dass sich Lesters Zustand hier auf der seltsamen Insel noch verschlechtert hat."); 
				};
			
				if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
				{
					Log_AddEntry (TOPIC_MyCrew,"Mario ist ein wenig seltsam. Er hockte die gesamte Überfahrt am Heck des Schiffes und hat seitdem noch kein Wort gesagt. "); 
				};
			
				if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
				{
						Log_AddEntry (TOPIC_MyCrew,"Wolf kann mir Armbrust und Bogenschießen beibringen."); 
				};
			
			
				if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
				{
					Log_AddEntry (TOPIC_MyCrew,"Vatras hat sich in die Magierkajüte zurück gezogen. Bei ihm kann ich mich heilen lassen und eine Menge über das Tränkebrauen lernen. "); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Vatras kann auch meinen magischen Kreis erhöhen. "); 
					};
				};	
				
				if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
				{
					Log_AddEntry (TOPIC_MyCrew,"Bennet bringt mir das Schmieden bei, wenn ich es will."); 
				};	
			
				if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
				{
					Log_AddEntry (TOPIC_MyCrew,"Diego will mir helfen, wenn ich nicht mehr weiter weiß, und hat Munition für mich. Bei ihm kann ich das Schlösser knacken und Bogen- oder Armbrustschießen lernen."); 
				};
			
				if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
				{
					Log_AddEntry (TOPIC_MyCrew,"Gorn hat auf unserer Reise kein bisschen geschlafen. Er wird auf das Schiff acht geben. Ich denke, es ist bei ihm in guten Händen."); 
					Log_AddEntry (TOPIC_MyCrew,"Bei Gorn kann ich meine Fähigkeiten mit der Zweihandwaffen verbessern."); 
				};	
			
				if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
				{
					Log_AddEntry (TOPIC_MyCrew,"Lares hat versprochen, mir das Schleichen und den Einhandkampf beizubringen. Ausserdem kann er meine Geschicklichkeit verbessern."); 
				};	
			
				if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
				{
					Log_AddEntry (TOPIC_MyCrew,"Biff ist so auf Geld versessen, dass es schon bald weh tut. Es wird schwierig sein, ihn in Zaum zu halten."); 
				};	
			
				if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
				{
					Log_AddEntry (TOPIC_MyCrew,"Angar wirkt sehr beunruhigt. Ich habe den Eindruck, dass es nciht mehr lange dauert, dann zieht er auf eigene Faust in den Kampf."); 
				};	
			
				if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
				{
					Log_AddEntry (TOPIC_MyCrew,"Girion hält sehr zurück. Bewundernswert seine Geduld. Immerhin ist er Kampflehrer. Vielleicht kommt mir das hier noch zu Gute."); 
				};	
	
		IntroduceChapter (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);
		EnterDI_Kapitel6 = TRUE;
		};
};
