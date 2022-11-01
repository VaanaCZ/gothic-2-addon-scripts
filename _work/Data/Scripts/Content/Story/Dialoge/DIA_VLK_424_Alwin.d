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
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_01"); //Jedyna, która do mnie należy, reaguje na imię Lucy. To moja żona...
	AI_Output (self ,other,"DIA_Alwin_Sheep_12_02"); //Owce są własnością straży. Przyprowadzają do mnie wszystkie biedulki, które zabiorą farmerom.
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
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_00"); //Chłopie, ten świr z młotkiem mnie dobija.
	AI_Output (other, self,"DIA_Alwin_Fellan_15_01"); //O kim ty mówisz?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_02"); //Nie słyszysz tego walenia? A jak myślisz, kto w porcie przez cały dzień tłucze młotkiem?
	AI_Output (self ,other,"DIA_Alwin_Fellan_12_03"); //O tym wariacie, Fellanie. Codziennie zabiera ze sobą młotek do szopy.
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
	description = "Mogę się zająć Fellanem...";
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
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_00"); //Mogę się zająć Fellanem...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_01"); //Chcesz mi pomóc? A jaki masz w tym interes?
	AI_Output (other, self,"DIA_Alwin_FellanRunning_15_02"); //Ty mi to powiedz.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_03"); //Ach, o to chodzi! Dobra - jeśli przestanie walić tym młotkiem, to zapłacę ci 25 sztuk złota.
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_12_04"); //Ale muszę ci coś powiedzieć - nie zdołasz go przekonać. To świr. Dotrze do niego tylko wtedy, jak mu zdrowo przyłożysz!
	
	MIS_AttackFellan = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Alwin,LOG_RUNNING);
	B_LogEntry (TOPIC_Alwin,"Alwin chce, abym zmusił Fellana do przerwania prac na dachu. Zabójstwo nie jest dobrą metodą.");
		
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
	Info_AddChoice (DIA_Alwin_FellanRunning, "Zobaczę, co da się zrobić...", DIA_Alwin_FellanRunning_Ok);
	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF)
	{
		Info_AddChoice (DIA_Alwin_FellanRunning, "Jeśli go pobiję, będę miał kłopoty ze strażą...", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Ok_15_00"); //Zobaczę, co da się zrobić...
	AI_Output (self ,other,"DIA_Alwin_FellanRunning_Ok_12_01"); //Zastanów się. Pamiętaj, płacę 25 złotych monet.
	
	Info_ClearChoices (DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output (other, self,"DIA_Alwin_FellanRunning_Problems_15_00"); //Jeśli go pobiję, będę miał kłopoty ze strażą...
	AI_Output (self ,other,"DIA_Alwin_Add_12_00"); //Tutaj w porcie nikt nie zwraca specjalnej uwagi na walki...
	AI_Output (self ,other,"DIA_Alwin_Add_12_01"); //Ale jeśli kogoś tu okradniesz, albo zaczniesz coś kombinować z owcami, to wpadniesz w kłopoty.

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
	description	= "Fellan już nie będzie walił młotkiem.";
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
	AI_Output (other, self,"DIA_Alwin_FellanSuccess_15_00"); //Fellan już nie będzie walił młotkiem.
	AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_01"); //Słyszysz? Koniec z tym hałasem! W końcu. Myślałem, że ten koleś nigdy nie zrezygnuje.
	
	if (Npc_IsDead (Fellan) == FALSE) 
	{
		AI_Output (self ,other,"DIA_Alwin_FellanSuccess_12_02"); //Zrobiłeś mi wielką przysługę. Wiesz co, dam ci 30 sztuk złota.
		
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
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_01"); //Fellan ciągle hałasuje i to je doprowadza do szaleństwa. Któregoś dnia całkiem ześwirują.
		
	}
	else if (Kapitel <= 2)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_02"); //Owce jedzą i robią się coraz grubsze. Całkiem jak moja żona. HA HA HA.
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_03"); //Chyba będę musiał jedną z nich zaszlachtować. Na ostatnią wieczerzę!
			AI_Output (other, self,"DIA_Alwin_Endlos_15_04"); //Po co?
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_05"); //Dla najemnika, który zamordował paladyna. Oczywiście stracą go za to.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_06"); //Muszę tylko zdecydować, które stworzonko powędruje do rzeźni.
		}
		else
		{
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_07"); //Lucy ma wielkie szczęście, że jeszcze żyje.
			AI_Output (other, self,"DIA_Alwin_Endlos_15_08"); //Myślałem, że Lucy jest twoją żoną.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_09"); //Racja, ale jedną owcę też nazwałem Lucy. Tę, która miała być ostatnim posiłkiem Benneta.
			AI_Output (self ,other,"DIA_Alwin_Endlos_12_10"); //Ale wszystko się jakoś ułożyło. Lucy będzie zadowolona.
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_11"); //Po pewnym czasie obserwowanie, jak owce jedzą, staje się dość nudne.
	}
	else	//Kapitel 5
	{
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_12"); //Muszę się z nimi pożegnać. Lord Hagen postanowił, że wszystkie owce pójdą na pożywienie dla armii.
		AI_Output (self ,other,"DIA_Alwin_Endlos_12_13"); //Cóż, przynajmniej będę miał więcej czasu dla żony.
	};
};



