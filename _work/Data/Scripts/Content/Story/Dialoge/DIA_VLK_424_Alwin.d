// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Alwin_EXIT(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 999;
	condition	= DIA_Alwin_EXIT_Condition;
	information	= DIA_Alwin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alwin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Alwin_PICKPOCKET (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 900;
	condition	= DIA_Alwin_PICKPOCKET_Condition;
	information	= DIA_Alwin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen (20, 10);
};
 
FUNC VOID DIA_Alwin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alwin_PICKPOCKET);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_BACK 		,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
	
func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alwin_PICKPOCKET);
};
//***************************************************
//		Schafe
//***************************************************
INSTANCE DIA_Alwin_Sheep(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 3;
	condition	= DIA_Alwin_Sheep_Condition;
	information	= DIA_Alwin_Sheep_Info;
	permanent	= FALSE;
	description = "Tohle jsou tvoje ovce?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //Tohle jsou tvoje ovce?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Ke mnÏ pat¯Ì jenom ta, kter· nese jmÈno Lucy (usmÏje se) - a to je moje ûena.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Ovce jsou majetkem domobrany - hned, jak je zÌskajÌ od farm·¯˘, p¯ivedou je ke mnÏ.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_Fellan(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_Fellan_Condition;
	information	= DIA_Alwin_Fellan_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Alwin_Fellan_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Fellan_Info()
{	
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Hochu, to öÌlenÈ ml·cenÌ kladivem mÏ p¯ivede do hrobu.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //O Ëem to mluvÌö?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Copak neslyöÌö ty r·ny? Kdo asi tak m˘ûe v p¯ÌstavnÌ Ëtvrti od r·na do veËera buöit kladivem?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //MyslÌm toho cvoka Fellana. Kaûd˝ den si do tÈ svÈ chatrËe bere kladivo.
};
//***************************************************
//		Der irre Fellan
//***************************************************
INSTANCE DIA_Alwin_FellanRunning (C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 2;
	condition	= DIA_Alwin_FellanRunning_Condition;
	information	= DIA_Alwin_FellanRunning_Info;
	permanent	= FALSE;
	description = "Mohl bych se o Fellana postarat...";
};                       
FUNC INT DIA_Alwin_FellanRunning_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanRunning_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Mohl bych se o Fellana postarat.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Ty mi chceö pomoct? A co z toho budeö mÌt?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //To mi povÏz ty.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Aha, tak je to! No dob¯e - kdyû to jeho buöenÌ nÏjak umlËÌö, zaplatÌm ti 25 zlaù·k˘.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Ale upozorÚuju tÏ, ûe s nÌm rozumnou domluvou nic nesvedeö - je to tot·lnÌ magor. Jedin· vÏc, kter· by mu pomohla, je p·r dob¯e mÌ¯en˝ch facek!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin mÏ poû·dal, zda bych nep¯imÏl Fellana, aby p¯estal buöit kladivem. ZabÌt ho ale nebude zrovna to nejlepöÌ ¯eöenÌ.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "UvidÌm, co se d· dÏlat...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Kdyû ho zml·tÌm, budu z toho mÌt jenom opletaËky s domobranou...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //UvidÌm, co se d· dÏlat.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Jen si to rozmysli a pamatuj si, ûe jsem ti slÌbil 25 zlaù·k˘.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Kdyû ho zml·tÌm, budu z toho mÌt jenom opletaËky s domobranou.
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Tady v p¯Ìstavu se nÏjak· ta rvaËka tak tragicky nebere.
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Ale jestli tu nÏkde nÏco ölohneö nebo mi ö·hneö na ovce, budeö v pÏknym pr˘övihu.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du kˆnntest hˆchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schl‰gereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_03"); //Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen 
//***************************************************
INSTANCE DIA_Alwin_FellanSuccess(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 4;
	condition	= DIA_Alwin_FellanSuccess_Condition;
	information	= DIA_Alwin_FellanSuccess_Info;
	permanent	= FALSE;
	description	= "Fellan uû kladivem tlouci nebude.";
};                       
FUNC INT DIA_Alwin_FellanSuccess_Condition()
{	
	if (MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead (Fellan))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_FellanSuccess_Info()
{	
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan uû kladivem tlouct nebude.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //SlyöÌö to? Ticho - û·dnÈ r·ny. KoneËnÏ. Myslel jsem, ûe ten chlap nikdy nezmlkne.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Prok·zals mi velkou laskavost. VÌö co? D·m ti cel˝ch 30 zlaù·k˘.
		
		B_GiveInvItems (self, other, ItMi_Gold, 30);
		
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient); 
	}
	else 
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};
//***************************************************
//		Perm Info
//***************************************************
INSTANCE DIA_Alwin_Endlos(C_INFO)
{
	npc			= Vlk_424_Alwin;
	nr			= 8;
	condition	= DIA_Alwin_Endlos_Condition;
	information	= DIA_Alwin_Endlos_Info;
	permanent	= TRUE;
	description	= "A jak se da¯Ì ovcÌm?";
};                       
FUNC INT DIA_Alwin_Endlos_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Alwin_Sheep)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Alwin_Endlos_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //A jak se da¯Ì ovcÌm?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Z toho Fellanova ml·cenÌ uû pomalu öÌlÌ. JeötÏ p·r dnÌ a budou ˙plnÏ naörot.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Ovce se jen cpou a jsou ËÌm d·l tÌm tlustöÌ. StejnÏ jako moje ûena. HAHAHA (hlasitÏ se smÏje).
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Moûn· bych mÏl jednu z nich klepnout - jako poslednÌ veËe¯i!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Jako co?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Pro jednoho ûold·ka, kter˝ zabil paladina. Samoz¯ejmÏ ho za to popravÌ.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Jen se musÌm rozhodnout, kter· z nich p˘jde na popravËÌ öpalek.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy m· opravdu ötÏstÌ, ûe je jeötÏ naûivu.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Myslel jsem, ûe jsi ¯Ìkal, ûe Lucy je tv· ûena.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Spr·vnÏ, ale jedna z ovcÌ se taky jmenuje Lucy. Pr·vÏ ona mÏla b˝t poslednÌm jÌdlem pro Benneta.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Ale nakonec se to vöechno vy¯eöilo a Lucy m˘ûe b˝t r·da.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //»asem je ale pozorov·nÌ pasoucÌch se ovcÌ docela nuda.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Tak se s nimi louËÌm. Lord Hagen rozk·zal, ûe vöechny ovce poslouûÌ jako z·soby pro jeho arm·du.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Ale aspoÚ budu mÌt vÌc Ëasu na svou ûenu.
	};
};



