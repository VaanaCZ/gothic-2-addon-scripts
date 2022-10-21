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
						B_LogEntry (TOPIC_HallenVonIrdorath,"La nuit dernière, j'ai fait un rêve. Xardas me parlait. Il me demandait d'aller au laboratoire d'alchimie sur le bateau pour y récupérer quelque chose. C'était très étrange et pourtant je n'avais rien bu la veille."); 
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
					Log_AddEntry (TOPIC_MyCrew,"Jorgen, mon capitaine, attendra sur le navire que je revienne."); 
				};
			
				if ( TorlofIsCaptain == TRUE)	//Torlof
				{
					Log_AddEntry (TOPIC_MyCrew,"Torlof, mon capitaine, restera sur le navire pour le défendre, tant que je serai sur l'île. Avec lui, je peux améliorer ma force et ma dextérité."); 
				};
			
				if ( JackIsCaptain == TRUE)		//Jack
				{
					Log_AddEntry (TOPIC_MyCrew,"Jack, mon capitaine, attendra sur le navire que je revienne. Il a l'air un peu effrayé. J'espère qu'il va se calmer. J'ai besoin de lui."); 
				};
				
			//----- Die Crew -----
				
				if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
				{
					Log_AddEntry (TOPIC_MyCrew,"Lee va prendre le commandement du navire pendant mon absence. Avec son aide, je peux améliorer mes compétences dans le maniement des armes à une main et à deux mains."); 
				};
			
				if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
				{
					Log_AddEntry (TOPIC_MyCrew,"Avec Milten, je peux augmenter mon mana."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Milten peut aussi m'apprendre comment créer des runes."); 
					};
				};
			
				if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
				{
					Log_AddEntry (TOPIC_MyCrew,"J'ai l'impression que l'état de Lester a empiré sur cette étrange île."); 
				};
			
				if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
				{
					Log_AddEntry (TOPIC_MyCrew,"Mario est un peu étrange. Il est resté assis à la poupe du bateau pendant tout le voyage. Il n'a pas dit un mot."); 
				};
			
				if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
				{
						Log_AddEntry (TOPIC_MyCrew,"Wolf peut m'apprendre à utiliser un arc et une arbalète."); 
				};
			
			
				if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
				{
					Log_AddEntry (TOPIC_MyCrew,"Vatras s'est retiré dans sa cabine. Il peut me soigner et m'apprendre comment préparer des potions."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Vatras peut également me permettre d'accéder aux autres cercles de magie."); 
					};
				};	
				
				if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
				{
					Log_AddEntry (TOPIC_MyCrew,"Si je le désire, Bennet peut m'apprendre l'art de la forge."); 
				};	
			
				if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
				{
					Log_AddEntry (TOPIC_MyCrew,"Diego m'aidera si je ne sais pas quoi faire et il a des munitions pour moi. Il peut m'apprendre à crocheter des serrures et à utiliser un arc et une arbalète."); 
				};
			
				if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
				{
					Log_AddEntry (TOPIC_MyCrew,"Gorn n'a pas fermé l'œil pendant tout le voyage. Il veillera sur le bateau. Je pense qu'il sera entre de bonne mains avec lui."); 
					Log_AddEntry (TOPIC_MyCrew,"Gorn peut m'aider à m'améliorer dans le maniement des armes à deux mains."); 
				};	
			
				if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
				{
					Log_AddEntry (TOPIC_MyCrew,"Lares m'a promis de m'enseigner la discrétion et le combat avec des armes à une main. Il peut également me permettre d'améliorer ma dextérité."); 
				};	
			
				if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
				{
					Log_AddEntry (TOPIC_MyCrew,"Biff est tellement cupide que cela pose des problèmes. Il sera difficile de le contrôler."); 
				};	
			
				if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
				{
					Log_AddEntry (TOPIC_MyCrew,"Angar semble très agité. Je crois qu'il ne va pas tarder à se lancer seul dans la bataille."); 
				};	
			
				if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
				{
					Log_AddEntry (TOPIC_MyCrew,"Girion prend beaucoup sur lui. Sa patience est admirable et c'est un excellent maître d'armes. Je pourrais certainement en tirer bénéfice."); 
				};	
	
		IntroduceChapter (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);
		EnterDI_Kapitel6 = TRUE;
		};
};
