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
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Ke mnê patâí jenom ta, která nese jméno Lucy (usmêje se) - a to je moje žena.
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Ovce jsou majetkem domobrany - hned, jak je získají od farmáâù, pâivedou je ke mnê.
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
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Hochu, to šílené mlácení kladivem mê pâivede do hrobu.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //O èem to mluvíš?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Copak neslyšíš ty rány? Kdo asi tak mùže v pâístavní ètvrti od rána do veèera bušit kladivem?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //Myslím toho cvoka Fellana. Každý den si do té své chatrèe bere kladivo.
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
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Ty mi chceš pomoct? A co z toho budeš mít?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //To mi povêz ty.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Aha, tak je to! No dobâe - když to jeho bušení nêjak umlèíš, zaplatím ti 25 zlaãákù.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Ale upozoràuju tê, že s ním rozumnou domluvou nic nesvedeš - je to totální magor. Jediná vêc, která by mu pomohla, je pár dobâe míâených facek!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin mê požádal, zda bych nepâimêl Fellana, aby pâestal bušit kladivem. Zabít ho ale nebude zrovna to nejlepší âešení.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Uvidím, co se dá dêlat...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Když ho zmlátím, budu z toho mít jenom opletaèky s domobranou...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Uvidím, co se dá dêlat.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Jen si to rozmysli a pamatuj si, že jsem ti slíbil 25 zlaãákù.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Když ho zmlátím, budu z toho mít jenom opletaèky s domobranou.
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Tady v pâístavu se nêjaká ta rvaèka tak tragicky nebere.
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Ale jestli tu nêkde nêco šlohneš nebo mi šáhneš na ovce, budeš v pêknym prùšvihu.

	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_01"); //Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	//AI_Output (self ,other,"DIA_Alwin_FellanRunning_Problems_12_02"); //Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
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
	description	= "Fellan už kladivem tlouci nebude.";
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
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan už kladivem tlouct nebude.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //Slyšíš to? Ticho - žádné rány. Koneènê. Myslel jsem, že ten chlap nikdy nezmlkne.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Prokázals mi velkou laskavost. Víš co? Dám ti celých 30 zlaãákù.
		
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
	description	= "A jak se daâí ovcím?";
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
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //A jak se daâí ovcím?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Z toho Fellanova mlácení už pomalu šílí. Ještê pár dní a budou úplnê našrot.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Ovce se jen cpou a jsou èím dál tím tlustší. Stejnê jako moje žena. HAHAHA (hlasitê se smêje).
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Možná bych mêl jednu z nich klepnout - jako poslední veèeâi!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Jako co?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Pro jednoho žoldáka, který zabil paladina. Samozâejmê ho za to popraví.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Jen se musím rozhodnout, která z nich pùjde na popravèí špalek.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy má opravdu štêstí, že je ještê naživu.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Myslel jsem, že jsi âíkal, že Lucy je tvá žena.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Správnê, ale jedna z ovcí se taky jmenuje Lucy. Právê ona mêla být posledním jídlem pro Benneta.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Ale nakonec se to všechno vyâešilo a Lucy mùže být ráda.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Èasem je ale pozorování pasoucích se ovcí docela nuda.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Tak se s nimi louèím. Lord Hagen rozkázal, že všechny ovce poslouží jako zásoby pro jeho armádu.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Ale aspoà budu mít víc èasu na svou ženu.
	};
};



