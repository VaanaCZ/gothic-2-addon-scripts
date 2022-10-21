//****************************
// 	ENTER_DI_FIRSTTIME_TRIGGER 
//****************************
var int EnterDI_Kapitel6;

func void ENTER_DI_FIRSTTIME_TRIGGER ()
{
	//----- Levelchange verbarrikadieren --------
	if (Npc_HasItems (hero,ITKE_SHIP_LEVELCHANGE_MIS))
	{
		Npc_RemoveInvItems	(hero,	ITKE_SHIP_LEVELCHANGE_MIS,1);	//Joly: denn SHIP zen wird bei DRAGONISLAND UND NEWWORLD benutzt. Beim betreten der Insel ist die T�r wieder zu!!!!
	};
	
	
	if (hero.attribute[ATR_DEXTERITY] < 15)//Joly:wegen Br�ckenevent
	{
		Wld_InsertItem	(ItPo_Perm_DEX, "FP_ITEM_DI_ENTER_05");
	};

//###############################################
//##
//##	B_ENTER_DRAGONISLAND			
//##	//Joly: Steht hier, denn hier bin ich sicher, 
//##	dass alle am start sind und k�nnen bef�llt werden!
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
						B_LogEntry (TOPIC_HallenVonIrdorath,"Dnes v noci jsem m�l zvl�tn� sen. Hovo�il se mnou Xardas a ��dal m�, abych na lodi p�istoupil k alchymistick� kolon� a n�co odtamtud sebral. Bylo to velmi zvl�tn�, proto�e jsem ve�er p�ed t�m kupodivu v�bec nic nepil. Mo�n� to bylo delirium ze st��zlivosti."); 
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

			//----- Die Kapit�ne -----
	
				if ( JorgenIsCaptain == TRUE)	//Jorgen
				{
					Log_AddEntry (TOPIC_MyCrew,"Kapit�n Jorgen z�stane na lodi, dokud se nevr�t�m."); 
				};
			
				if ( TorlofIsCaptain == TRUE)	//Torlof
				{
					Log_AddEntry (TOPIC_MyCrew,"Kapit�n Torlof z�stane na lodi a bude ji hl�dat po celou dobu, co budu na ostrov�. P�itom za n�m mohu zaj�t, pokud si budu cht�t zv��it obratnost �i s�lu."); 
				};
			
				if ( JackIsCaptain == TRUE)		//Jack
				{
					Log_AddEntry (TOPIC_MyCrew,"Kapit�n Jack z�stane tady na lodi, dokud se nevr�t�m. Je sice trochu vyd�en�, ale douf�m, �e se �asem uklidn�. Pot�ebuji ho."); 
				};
				
			//----- Die Crew -----
				
				if ( Lee_IsOnBoard == LOG_SUCCESS) //Lee
				{
					Log_AddEntry (TOPIC_MyCrew,"Lee po dobu m� nep��tomnosti dohl�dne na lo�. Tak� se u n�j mohu zastavit, budu-li si cht�t vylep�it schopnosti boje jednoru�n�mi a obouru�n�mi zbran�mi."); 
				};
			
				if ( MiltenNW_IsOnBoard == LOG_SUCCESS) //Milten
				{
					Log_AddEntry (TOPIC_MyCrew,"S Miltenovou pomoc� si mohu zv��it sv� z�soby many."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Milten mi krom toho m��e vysv�tlit, jak vyrobit runy."); 
					};
				};
			
				if ( Lester_IsOnBoard == LOG_SUCCESS)	//Lester
				{
					Log_AddEntry (TOPIC_MyCrew,"M�m pocit, �e na tom podivn�m ostrov� se Lester�v stav je�t� zhor�il."); 
				};
			
				if ( Mario_IsOnBoard == LOG_SUCCESS) //Mario
				{
					Log_AddEntry (TOPIC_MyCrew,"Mario je n�jak� divn�. Po celou dobu plavby jen sed� na z�di a nepromluv� ani slovo."); 
				};
			
				if ( Wolf_IsOnBoard== LOG_SUCCESS) //Wolf
				{
						Log_AddEntry (TOPIC_MyCrew,"Vlk m� nau�� st��let z luku a ku�e."); 
				};
			
			
				if ( Vatras_IsOnBoard == LOG_SUCCESS)	//Vatras
				{
					Log_AddEntry (TOPIC_MyCrew,"Vatras se uch�lil do kajuty pro m�gy. M��e m� uzdravit a prozradit mi spoustu v�c� ohledn� m�ch�n� lektvar�."); 
					if (hero.guild == GIL_KDF)
					{
						Log_AddEntry (TOPIC_MyCrew,"Vatras mi tak� m��e pomoci s postupem do dal��ho magick�ho kruhu."); 
					};
				};	
				
				if ( Bennet_IsOnBoard == LOG_SUCCESS)	//Bennet
				{
					Log_AddEntry (TOPIC_MyCrew,"Bennet m� nau�� kova�in�, kdy� ho o to po��d�m."); 
				};	
			
				if ( Diego_IsOnBoard == LOG_SUCCESS)	//Diego 
				{
					Log_AddEntry (TOPIC_MyCrew,"Kdy� nebudu v�d�t, kudy kam, mohu se obr�tit na Diega, kter� m� nav�c z�sob� st�elivem. Tak� m� nau�� p��it z�mky a st��let z luku a ku�e."); 
				};
			
				if ( Gorn_IsOnBoard == LOG_SUCCESS)	//Gorn
				{
					Log_AddEntry (TOPIC_MyCrew,"Gorn b�hem na�eho v�letu nezah�lel a te� na lo� dohl�dne. Mysl�m, �e kdy� mu ji sv���m, bude v dobr�ch rukou."); 
					Log_AddEntry (TOPIC_MyCrew,"S Gornovou pomoc� se mohu zlep�it v ovl�d�n� obouru�n�ch zbran�."); 
				};	
			
				if ( Lares_IsOnBoard == LOG_SUCCESS)	//Lares
				{
					Log_AddEntry (TOPIC_MyCrew,"Lares mi sl�bil, �e m� nau�� pl�en� a jednoru�n�mu boji. Krom toho si u n�j mohu vylep�it obratnost."); 
				};	
			
				if ( Biff_IsOnBoard == LOG_SUCCESS)	//Biff
				{
					Log_AddEntry (TOPIC_MyCrew,"Biff je tak hami�n�, a� to bol�. Nebude snadn� na n�j dohl�et."); 
				};	
			
				if ( Angar_IsOnBoard == LOG_SUCCESS)	//Angar
				{
					Log_AddEntry (TOPIC_MyCrew,"Angar nem� nikde st�n�. M�m pocit, �e se zanedlouho pust� do boje s�m se sebou."); 
				};	
			
				if ( Girion_IsOnBoard == LOG_SUCCESS)	//Girion
				{
					Log_AddEntry (TOPIC_MyCrew,"Girion se dr�� po��dn� stranou - jeho trp�livost je obdivuhodn�. A p�itom je to bojov� cvi�itel. To se mi na konci m��e hodit."); 
				};	
	
		IntroduceChapter (KapWechsel_6,KapWechsel_6_Text,"chapter6.tga","chapter_01.wav", 6000);
		EnterDI_Kapitel6 = TRUE;
		};
};
