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
						B_LogEntry (TOPIC_HallenVonIrdorath,"Dnes v noci jsem męl zvláštní sen. Hovoâil se mnou Xardas a žádal mę, abych na lodi pâistoupil k alchymistické kolonę a nęco odtamtud sebral. Bylo to velmi zvláštní, protože jsem večer pâed tím kupodivu vůbec nic nepil. Možná to bylo delirium ze stâízlivosti."); 
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
					Log_AddEntry (TOPIC_MyCrew,"Kapitán Jorgen zůstane na lodi, dokud se nevrátím."); 
				};
			
				if ( TorlofIsCaptain == TRUE)	//Torlof
				{
					Log_AddEntry (TOPIC_MyCrew,"Kapitán Torlof zůstane na lodi a bude ji hlídat po celou dobu, co budu na ostrovę. Pâitom za ním mohu zajít, pokud si budu chtít zvýšit obratnost či sílu."); 
				};
			
				if ( JackIsCaptain == TRUE)		//Jack
				{
					Log_AddEntry (TOPIC_MyCrew,"Kapitán Jack zůstane tady na lodi, dokud se nevrátím. Je sice trochu vydęšený, ale doufám, že se časem uklidní. Potâebuji ho."); 
				};
				
			//----- Die Crew -----
				
				if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
				{
					Log_AddEntry (TOPIC_MyCrew,"Lee po dobu mé nepâítomnosti dohlédne na loë. Také se u nęj mohu zastavit, budu-li si chtít vylepšit schopnosti boje jednoručními a obouručními zbranęmi."); 
				};
			
				if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
				{
					Log_AddEntry (TOPIC_MyCrew,"S Miltenovou pomocí si mohu zvýšit své zásoby many."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Milten mi krom toho může vysvętlit, jak vyrobit runy."); 
					};
				};
			
				if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
				{
					Log_AddEntry (TOPIC_MyCrew,"Mám pocit, že na tom podivném ostrovę se Lesterův stav ještę zhoršil."); 
				};
			
				if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
				{
					Log_AddEntry (TOPIC_MyCrew,"Mario je nęjaký divný. Po celou dobu plavby jen sedí na zádi a nepromluví ani slovo."); 
				};
			
				if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
				{
						Log_AddEntry (TOPIC_MyCrew,"Vlk mę naučí stâílet z luku a kuše."); 
				};
			
			
				if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
				{
					Log_AddEntry (TOPIC_MyCrew,"Vatras se uchýlil do kajuty pro mágy. Může mę uzdravit a prozradit mi spoustu vęcí ohlednę míchání lektvarů."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Vatras mi také může pomoci s postupem do dalšího magického kruhu."); 
					};
				};	
				
				if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
				{
					Log_AddEntry (TOPIC_MyCrew,"Bennet mę naučí kovaâinę, když ho o to požádám."); 
				};	
			
				if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
				{
					Log_AddEntry (TOPIC_MyCrew,"Když nebudu vędęt, kudy kam, mohu se obrátit na Diega, který mę navíc zásobí stâelivem. Také mę naučí páčit zámky a stâílet z luku a kuše."); 
				};
			
				if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
				{
					Log_AddEntry (TOPIC_MyCrew,"Gorn bęhem našeho výletu nezahálel a teë na loë dohlédne. Myslím, že když mu ji svęâím, bude v dobrých rukou."); 
					Log_AddEntry (TOPIC_MyCrew,"S Gornovou pomocí se mohu zlepšit v ovládání obouručních zbraní."); 
				};	
			
				if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
				{
					Log_AddEntry (TOPIC_MyCrew,"Lares mi slíbil, že mę naučí plížení a jednoručnímu boji. Krom toho si u nęj mohu vylepšit obratnost."); 
				};	
			
				if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
				{
					Log_AddEntry (TOPIC_MyCrew,"Biff je tak hamižný, až to bolí. Nebude snadné na nęj dohlížet."); 
				};	
			
				if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
				{
					Log_AddEntry (TOPIC_MyCrew,"Angar nemá nikde stání. Mám pocit, že se zanedlouho pustí do boje sám se sebou."); 
				};	
			
				if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
				{
					Log_AddEntry (TOPIC_MyCrew,"Girion se drží poâádnę stranou - jeho trpęlivost je obdivuhodná. A pâitom je to bojový cvičitel. To se mi na konci může hodit."); 
				};	
	
		IntroduceChapter (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);
		EnterDI_Kapitel6 = TRUE;
		};
};
