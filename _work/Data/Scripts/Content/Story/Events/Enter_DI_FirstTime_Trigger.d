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
						B_LogEntry (TOPIC_HallenVonIrdorath,"Anoche tuve un sueño. Xardas me estaba hablando, me decía que tenía que ir a la mesa de trabajo de alquimista del barco para recoger algo. Fue muy raro, pero lo cierto es que no había bebido nada."); 
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
					Log_AddEntry (TOPIC_MyCrew,"Jorgen, mi capitán, esperará en el barco hasta que vuelva."); 
				};
			
				if ( TorlofIsCaptain == TRUE)	//Torlof
				{
					Log_AddEntry (TOPIC_MyCrew,"Torlof, el capitán, esperará en la nave para defenderla mientras estoy en la isla. Con él puedo mejorar mi fuerza y mi destreza."); 
				};
			
				if ( JackIsCaptain == TRUE)		//Jack
				{
					Log_AddEntry (TOPIC_MyCrew,"Jack, mi capitán, esperará en la nave hasta que vuelva. Parece algo asustado. Espero que se calme con el tiempo. Lo necesito."); 
				};
				
			//----- Die Crew -----
				
				if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
				{
					Log_AddEntry (TOPIC_MyCrew,"Lee mandará en la nave mientras yo esté ausente. Con su ayuda puedo mejorar mi habilidad con armas de una y dos manos."); 
				};
			
				if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
				{
					Log_AddEntry (TOPIC_MyCrew,"Con Milten puedo aumentar mi maná."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Además de eso, Milten puede enseñarme a crear runas."); 
					};
				};
			
				if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
				{
					Log_AddEntry (TOPIC_MyCrew,"Tengo la impresión de que Lester se ha puesto aún peor en la isla extraña."); 
				};
			
				if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
				{
					Log_AddEntry (TOPIC_MyCrew,"Mario es un poco raro. Se pasó todo el viaje sentado en la popa, sin decir una palabra."); 
				};
			
				if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
				{
						Log_AddEntry (TOPIC_MyCrew,"Wolf me puede enseñar a disparar la ballesta y el arco."); 
				};
			
			
				if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
				{
					Log_AddEntry (TOPIC_MyCrew,"Vatras se ha retirado al camarote de los magos. Puede curarme y enseñarme mucho del arte de destilar pociones."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Vatras puede aumentar también mi círculo mágico."); 
					};
				};	
				
				if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
				{
					Log_AddEntry (TOPIC_MyCrew,"Bennet me enseñará a forjar, si así se lo pido."); 
				};	
			
				if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
				{
					Log_AddEntry (TOPIC_MyCrew,"Diego me ayudará si no sé qué hacer, además de tener munición para mí. Puede enseñarme a forzar cerraduras y a disparar arcos y ballestas."); 
				};
			
				if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
				{
					Log_AddEntry (TOPIC_MyCrew,"Gorn no ha dormido nada en todo el viaje. Se encargará del cuidado del barco, que creo que estará en buenas manos."); 
					Log_AddEntry (TOPIC_MyCrew,"Gorn puede ayudarme a mejorar mi habilidad con armas a dos manos."); 
				};	
			
				if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
				{
					Log_AddEntry (TOPIC_MyCrew,"Lares ha prometido enseñarme a combatir a una mano y a ser sigiloso. Además, puede mejorar mi destreza."); 
				};	
			
				if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
				{
					Log_AddEntry (TOPIC_MyCrew,"Biff tiene un interés desmedido por el dinero. Será complicado controlarle."); 
				};	
			
				if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
				{
					Log_AddEntry (TOPIC_MyCrew,"Angar parece inquieto. Me parece que no tardará mucho en ir a la batalla por su cuenta."); 
				};	
			
				if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
				{
					Log_AddEntry (TOPIC_MyCrew,"Girion aguanta una barbaridad. Su paciencia es admirable. Y es instructor de combate, con lo que puede acabar siéndome útil."); 
				};	
	
		IntroduceChapter (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);
		EnterDI_Kapitel6 = TRUE;
		};
};
