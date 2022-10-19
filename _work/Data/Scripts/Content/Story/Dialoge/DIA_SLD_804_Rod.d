// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rod_EXIT(C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 999;
	condition	= DIA_Rod_EXIT_Condition;
	information	= DIA_Rod_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rod_EXIT_Info()
{	
	AI_EquipBestMeleeWeapon(self); 
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Rod_Hello (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_Hello_Condition;
	information	= DIA_Rod_Hello_Info;
	permanent	= FALSE;
	description	= "Je v�echno v po��dku?"; 
};                       

FUNC INT DIA_Rod_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Rod_Hello_Info()
{	
	AI_Output (other, self, "DIA_Rod_Hello_15_00"); //Jak se vede?
	if (other.guild != GIL_SLD)
	{
		AI_Output (self, other, "DIA_Rod_Hello_06_01"); //(pohrdav�) Co ode m� chce�, blbe�ku?
	
			if (other.guild == GIL_KDF)
			{
				AI_Output (self, other, "DIA_Rod_Hello_06_02"); //Nemohli pro tebe naj�t v kl�te�e m�sto?
			};	
	};
};

// ************************************************************
// 			  					WannaLearn 
// ************************************************************
var int Rod_SchwachGesagt;

instance DIA_Rod_WannaLearn (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 2;
	condition	= DIA_Rod_WannaLearn_Condition;
	information	= DIA_Rod_WannaLearn_Info;
	permanent	= TRUE;
	description	= "Nem��e� m� nau�it, jak zach�zet s obouru�n�mi zbran�mi?"; 
};                       

FUNC INT DIA_Rod_WannaLearn_Condition()
{
	if (Rod_Teach2H == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaLearn_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaLearn_15_00"); //Nem��e� m� nau�it, jak zach�zet s obouru�n�mi zbran�mi?
		
	if (Rod_WetteGewonnen == TRUE)
	|| (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_01"); //Nejsem �patn� bojovn�k, ale to neznamen�, �e jsem dobr� u�itel.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_02"); //Ale i tak ti m��u uk�zat z�klady boje s obouru�n�mi zbran�mi.
		
		if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
		{
			AI_Output (self, other, "DIA_Rod_WannaLearn_06_03"); //Tak to jo, pokud mi vr�t� m�j me�.
		}
		else
		{
			Rod_Teach2H = TRUE;
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_04"); //Poslouchej, chlap�e. K tomu, abys mohl nosit obouru�n� zbra�, pot�ebuje� m�t velkou s�lu.
		AI_Output (self, other, "DIA_Rod_WannaLearn_06_05"); //Pro� se neodplaz� na pastvinu a nezahraje� si tam s ove�kama chod� pe�ek okolo?
		Rod_SchwachGesagt = TRUE;
	};
};

// ******************************************************
//							Teach
// ******************************************************
var int Rod_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Rod_Teach(C_INFO)
{
	npc			= SLD_804_Rod;
	nr			= 3;
	condition	= DIA_Rod_Teach_Condition;
	information	= DIA_Rod_Teach_Info;
	permanent	= TRUE;
	description = "Chci si zdokonalit sv� bojov� dovednosti v obouru�n�ch zbran�ch!";
};                       

FUNC INT DIA_Rod_Teach_Condition()
{
	if (Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Teach_Info()
{	
	AI_Output (other,self, "DIA_Rod_Teach_15_00"); //Chci si zdokonalit sv� bojov� dovednosti v obouru�n�ch zbran�ch!

	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_Back ()
{
	if (Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Rod_Teach_BACK_06_00"); //U� se za��n� lep�it.
	};
	
	Info_ClearChoices (DIA_Rod_Teach);
};

FUNC VOID DIA_Rod_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

FUNC VOID DIA_Rod_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Rod_Teach);
	Info_AddChoice (DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Rod_Teach_2H_1);
	Info_AddChoice (DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Rod_Teach_2H_5);
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Rod_WannaJoin (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 4;
	condition	= DIA_Rod_WannaJoin_Condition;
	information	= DIA_Rod_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Chci se p�idat k �oldn���m!"; 
};                       

FUNC INT DIA_Rod_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Rod_WannaJoin_15_00"); //Chci se p�idat k �oldn���m!
	
	if (Npc_HasItems (self, ItMw_2h_Rod) == 0)
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_01"); //Tak�e co kdybys mi pro za��tek vr�til zp�tky m�j me�, co?
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| 		(Rod_WetteGewonnen == TRUE)
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{	
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_02"); //Fajn. Nem�m nic proti tomu.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_03"); //M��e� bojovat, a to je to, co se po��t�.
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_04"); //V�t�ina hoch� tady si z men��ch �arv�tek mezi p��teli ned�l� t�kou hlavu. Na to si brzy zvykne�.
		}
		else //WetteGewonnen
		{
			AI_Output (self, other, "DIA_Rod_WannaJoin_06_05"); //No dob�e, m� po��dn� me�. Zbytek se nau��.
		};
		
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_06"); //Co se m� t��e, tak j� t� beru.
		B_LogEntry (TOPIC_SLDRespekt,"Budu-li se cht�t p�ipojit k �oldn���m, Rod se za m� p�imluv�.");
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_WannaJoin_06_07"); //Tady nen� m�sto pro ��dn�ho stra�pytla!
		Rod_SchwachGesagt = TRUE;
	};
};

// ************************************************************
// 			  					Duell 
// ************************************************************

instance DIA_Rod_Duell (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 6;
	condition	= DIA_Rod_Duell_Condition;
	information	= DIA_Rod_Duell_Info;
	permanent	= TRUE;
	description	= "Vypad� to, �e ti budu muset uk�zat n�kolik trik�, �e jo?"; 
};                       

FUNC INT DIA_Rod_Duell_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if (Rod_WetteGewonnen == FALSE)
		&& (Rod_SchwachGesagt == TRUE)
		{
			return TRUE;
		};
	
		if (Mis_Jarvis_SldKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Rod_Duell_Info()
{	
	AI_Output (other, self, "DIA_Rod_Duell_15_00"); //Vypad� to, �e ti budu muset uk�zat n�kolik trik�, �e jo?
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_01"); //No tak to zkus!
	}
	else
	{
		AI_Output (self, other, "DIA_Rod_Duell_06_02"); //Ty se tohle st�� nau��!
	};
	
	AI_StopProcessInfos(self);
	B_Attack (self, other,AR_NONE, 1);
};	

// ************************************************************
// 			  				StarkGenug 
// ************************************************************

instance DIA_Rod_StarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_StarkGenug_Condition;
	information	= DIA_Rod_StarkGenug_Info;
	permanent	= FALSE;
	description	= "Jsem dost silnej!"; 
};                       

FUNC INT DIA_Rod_StarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Rod_SchwachGesagt == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_StarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_StarkGenug_15_00"); //Jsem dost silnej!
	AI_Output (self, other, "DIA_Rod_StarkGenug_06_01"); //Blbost! Ty bys nemohl uzvednout dokonce ani me�, jako je ten m�j!
	
	Log_CreateTopic (Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus (Topic_RodWette,LOG_RUNNING);
	B_LogEntry (Topic_RodWette,"�oldn�� Rod si mysl�, �e nedok�u uzvednout jeho me�.");
};	
	
	
// ************************************************************
// 			  				BINStarkGenug 
// ************************************************************

instance DIA_Rod_BINStarkGenug (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_BINStarkGenug_Condition;
	information	= DIA_Rod_BINStarkGenug_Info;
	permanent	= FALSE;
	description	= "�ekl jsem, �e JSEM dost silnej!"; 
};                       

FUNC INT DIA_Rod_BINStarkGenug_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_BINStarkGenug_Info()
{	
	AI_Output (other, self, "DIA_Rod_BINStarkGenug_15_00"); //�ekl jsem, �e JSEM dost silnej!
	AI_Output (self, other, "DIA_Rod_BINStarkGenug_06_01"); //Chach�a, asi um�u sm�chy. Chce� se vsadit?
};	
	

// ************************************************************
// 			  				Wette
// ************************************************************
var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
//-------------------------

instance DIA_Rod_Wette (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 5;
	condition	= DIA_Rod_Wette_Condition;
	information	= DIA_Rod_Wette_Info;
	permanent	= TRUE;
	description	= "Vsad�m se, �e zvl�dnu tv�j me�!"; 
};                       

FUNC INT DIA_Rod_Wette_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Rod_BINStarkGenug))
	&& (Npc_HasItems (self, ItMw_2h_Rod) > 0)
	&& (Rod_WetteAngenommen == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_Wette_Info()
{	
	AI_Output (other, self, "DIA_Rod_Wette_15_00"); //Vsad�m se, �e zvl�dnu tv�j me�!
	AI_Output (self, other, "DIA_Rod_Wette_06_01"); //Opravdu? Hmm... (p�em��l�) O kolik se vsad�me?
	AI_Output (self, other, "DIA_Rod_Wette_06_02"); //No vypad�, jako ubohej za��te�n�k. Vsa�me se o 30 zlat�ch! M� v�bec tolik?
		
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "Ne.", DIA_Rod_Wette_No);
	Info_AddChoice (DIA_Rod_Wette, "Jasn�.", DIA_Rod_Wette_Yes);
	
	B_LogEntry (Topic_RodWette,"Rod se se mnou vsadil o 30 zla��k�, �e neuzvednu jeho me�.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output (other, self, "DIA_Rod_Wette_No_15_00"); //Ne.
	AI_Output (self, other, "DIA_Rod_Wette_No_06_01"); //No, tak vypadni.
	
	Info_ClearChoices (DIA_Rod_Wette);
};
	
func void DIA_Rod_Wette_Yes()
{
	AI_Output (other, self, "DIA_Rod_Wette_Yes_15_00"); //Jasn�.
	AI_Output (self, other, "DIA_Rod_Wette_Yes_06_01"); //Nejd��v se kouknu...
	
	if (B_GiveInvItems (other,self, itmi_gold, 30))
	{
		Rod_WetteAngenommen = TRUE;
			
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_02"); //Tady jsou!
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_03"); //(�kodolib�) V po��dku, pod�v�me se teda, jak si silnej...
		
		B_GiveInvItems (self, other, ItMw_2h_Rod, 1);
		
		if (other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons 		(other);
			AI_EquipBestMeleeWeapon	(other);
			AI_ReadyMeleeWeapon		(other);
							
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_04");//Tak co ��k� na moj� s�lu?!
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_05");//(zmaten�) Vypad� to, �es m� dostal.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_06");//Tohle jsem v�bec ne�ekal. Opravdu nevypad� na to, �e m� v sob� tolik s�ly.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_07");//No - �ekl bych, �e jsem pr�v� p�i�el o 30 zlat�ch. Tady jsou.
			B_GiveInvItems (self, other, itmi_gold, 60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP (XP_Rod); 
		}
		else
		{
			AI_Output (other, self, "DIA_Rod_Wette_Yes_15_08"); //Tuhle zbra� neudr��m.
			AI_Output (self, other, "DIA_Rod_Wette_Yes_06_09");//(sm�je se) To ti p�ece ��k�m!
		};
		
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_10");//A te� mi dej zp�tky m�j me�.
		
		Info_ClearChoices (DIA_Rod_Wette);
		
		//Npc_RemoveInvItems (other,ItMw_2h_Rod,((Npc_HasItems (other,ItMw_2h_Rod))-1));		//Hoshi: Wilder HAck bitte stehen lassen!
		// Mike: AAAARGH!!!! genau DAS war der Fehler!!!
			
		Info_AddChoice (DIA_Rod_Wette, "Mysl�m, �e ne.", DIA_Rod_Wette_KeepIt);
		Info_AddChoice (DIA_Rod_Wette, "Tum�.", DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output (other, self, "DIA_Rod_Wette_Yes_15_11"); //Kam jsem ho tak mohl d�t...
		AI_Output (self, other, "DIA_Rod_Wette_Yes_06_12"); //To d�v� smysl. Vra� se zp�tky, a� bude� m�t pen�ze na s�zku.
		
		Info_ClearChoices (DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Rod_Wette_GiveBack_15_00"); //Tum�.
	Info_ClearChoices (DIA_Rod_Wette);
	Info_AddChoice (DIA_Rod_Wette, "(p�edat mu zbra�)", DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);		
	if (Rod_WetteGewonnen == FALSE)
	{
		AI_Output (self, other, "DIA_Rod_Wette_GiveBack_06_01"); //Nakonec nejsi stejn� nic jin�ho ne� stra�pytel!
	};
	Info_ClearChoices (DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_00"); //Mysl�m, �e ne.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_01"); //(v�hru�n�) Co to bylo?
	AI_Output (other, self, "DIA_Rod_Wette_KeepIt_15_02"); //Mysl�m, �e si ho je�t�  chv�li nech�m.
	AI_Output (self, other, "DIA_Rod_Wette_KeepIt_06_03"); //Po�kej, ty parchante!
	
	Info_ClearChoices (DIA_Rod_Wette);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1); 
};


// ************************************************************
// 			  				Schwert zur�ck
// ************************************************************
var int Rod_SchwertXPGiven;

instance DIA_Rod_GiveItBack (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 7;
	condition	= DIA_Rod_GiveItBack_Condition;
	information	= DIA_Rod_GiveItBack_Info;
	permanent	= TRUE;
	description	= "Tady m� me� zp�tky!"; 
};                       

FUNC INT DIA_Rod_GiveItBack_Condition()
{
	if (Npc_HasItems (other, ItMw_2h_Rod) > 0)
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_GiveItBack_Info()
{	
	B_GiveInvItems (other, self, ItMw_2h_Rod, 1);
	
	AI_Output (other, self, "DIA_Rod_GiveItBack_15_00"); //Tady m� me� zp�tky!
	AI_Output (self, other, "DIA_Rod_GiveItBack_06_01"); //Byl nejvy��� �as!
	
	if (Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP (XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};
};

// ************************************************************
// 			  					PERM
// ************************************************************

instance DIA_Rod_PERM (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 1;
	condition	= DIA_Rod_PERM_Condition;
	information	= DIA_Rod_PERM_Info;
	permanent	= TRUE;
	description	= "Jak to jde?"; 
};                       

FUNC INT DIA_Rod_PERM_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Rod_Hello))
	{	
		return TRUE;
	};
};
 
FUNC VOID DIA_Rod_PERM_Info()
{	
	AI_Output (other, self, "DIA_Rod_PERM_15_00"); //Jak se vede?
	
	if (Kapitel <= 2)	
	{
		if (other.guild == GIL_NONE)
		{
			if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
			&& (Rod_WetteGewonnen == FALSE)
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_01"); //To t� nemus� zaj�mat, padavko.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output (self, other, "DIA_Rod_PERM_06_02"); //Jsem zv�dav�, jestli ti dovol� se k nim p�idat.
			};
		}
		else if (other.guild == GIL_SLD)
		|| 		(other.guild == GIL_DJG)
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_03"); //Jsi jedn�m z n�s, chlap�e. Tak se n�jak dohodneme.
		}
		else
		{
			AI_Output (self, other, "DIA_Rod_PERM_06_04"); //Ty sem nepat��, rad�i by ses m�l j�t poflakovat n�kam jinam!
		};
	}

	if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Rod_PERM_06_05"); //Jestli jsou v�echny ty pov�da�ky o drac�ch skute�n� pravdiv�, m�li bychom d�t p�r lid� dohromady a j�t ty mrchy pozab�jet!
	};

	//### ab Kap 4 in OW ###
};

	
	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_RodSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_804_Rod;
	nr			= 900;
	condition	= DIA_RodSLD_PICKPOCKET_Condition;
	information	= DIA_RodSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_RodSLD_PICKPOCKET_Condition()
{
	C_Beklauen (15, 35);
};
 
FUNC VOID DIA_RodSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_BACK 		,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_RodSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};
	
func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_RodSLD_PICKPOCKET);
};






	
	
	




	
	
		



	
	
		
		







	
	//NUR Bis Kapitel 3!
	
	/**/
	
	
