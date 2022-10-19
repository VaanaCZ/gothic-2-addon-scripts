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
	description = "Czy to twoje owce?";
};                       
FUNC INT DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Alwin_Sheep_Info()
{	
	AI_Output (other, self,"DIA_Alwin_Sheep_15_00"); //Czy to twoje owce?
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Jedyna, która do mnie nale¿y, reaguje na imiê Lucy. To moja ¿ona...
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Owce s¹ w³asnoœci¹ stra¿y. Przyprowadzaj¹ do mnie wszystkie biedulki, które zabior¹ farmerom.
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
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Ch³opie, ten œwir z m³otkiem mnie dobija.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //O kim ty mówisz?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Nie s³yszysz tego walenia? A jak myœlisz, kto w porcie przez ca³y dzieñ t³ucze m³otkiem?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //O tym wariacie, Fellanie. Codziennie zabiera ze sob¹ m³otek do szopy.
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
	description = "Mogê siê zaj¹æ Fellanem...";
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
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Mogê siê zaj¹æ Fellanem...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Chcesz mi pomóc? A jaki masz w tym interes?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Ty mi to powiedz.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Ach, o to chodzi! Dobra - jeœli przestanie waliæ tym m³otkiem, to zap³acê ci 25 sztuk z³ota.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Ale muszê ci coœ powiedzieæ - nie zdo³asz go przekonaæ. To œwir. Dotrze do niego tylko wtedy, jak mu zdrowo przy³o¿ysz!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin chce, abym zmusi³ Fellana do przerwania prac na dachu. Zabójstwo nie jest dobr¹ metod¹.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Zobaczê, co da siê zrobiæ...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Jeœli go pobijê, bêdê mia³ k³opoty ze stra¿¹...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Zobaczê, co da siê zrobiæ...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Zastanów siê. Pamiêtaj, p³acê 25 z³otych monet.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Jeœli go pobijê, bêdê mia³ k³opoty ze stra¿¹...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Tutaj w porcie nikt nie zwraca specjalnej uwagi na walki...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Ale jeœli kogoœ tu okradniesz, albo zaczniesz coœ kombinowaæ z owcami, to wpadniesz w k³opoty.

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
	description	= "Fellan ju¿ nie bêdzie wali³ m³otkiem.";
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
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan ju¿ nie bêdzie wali³ m³otkiem.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //S³yszysz? Koniec z tym ha³asem! W koñcu. Myœla³em, ¿e ten koleœ nigdy nie zrezygnuje.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Zrobi³eœ mi wielk¹ przys³ugê. Wiesz co, dam ci 30 sztuk z³ota.
		
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
	description	= "A co z owcami?";
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
	AI_Output (other, self,"DIA_Alwin_Endlos_15_00"); //A co z owcami?
	
	if (MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead (Fellan) == FALSE)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Fellan ci¹gle ha³asuje i to je doprowadza do szaleñstwa. Któregoœ dnia ca³kiem zeœwiruj¹.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Owce jedz¹ i robi¹ siê coraz grubsze. Ca³kiem jak moja ¿ona. HA HA HA.
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Chyba bêdê musia³ jedn¹ z nich zaszlachtowaæ. Na ostatni¹ wieczerzê!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Po co?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Dla najemnika, który zamordowa³ paladyna. Oczywiœcie strac¹ go za to.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Muszê tylko zdecydowaæ, które stworzonko powêdruje do rzeŸni.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy ma wielkie szczêœcie, ¿e jeszcze ¿yje.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Myœla³em, ¿e Lucy jest twoj¹ ¿on¹.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Racja, ale jedn¹ owcê te¿ nazwa³em Lucy. Tê, która mia³a byæ ostatnim posi³kiem Benneta.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Ale wszystko siê jakoœ u³o¿y³o. Lucy bêdzie zadowolona.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Po pewnym czasie obserwowanie, jak owce jedz¹, staje siê doœæ nudne.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Muszê siê z nimi po¿egnaæ. Lord Hagen postanowi³, ¿e wszystkie owce pójd¹ na po¿ywienie dla armii.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Có¿, przynajmniej bêdê mia³ wiêcej czasu dla ¿ony.
	};
};



