///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Attila_EXIT   (C_INFO)
{
	npc         = VLK_494_Attila;
	nr          = 999;
	condition   = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Attila_PICKPOCKET (C_INFO)
{
	npc			= VLK_494_Attila;
	nr			= 900;
	condition	= DIA_Attila_PICKPOCKET_Condition;
	information	= DIA_Attila_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Attila_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Attila_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Attila_PICKPOCKET);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_BACK 		,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
	
func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo -> wenn Spieler Mist gebaut hat
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Hallo		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr 			 =  1;
	condition	 = 	DIA_Attila_Hallo_Condition;
	information	 = 	DIA_Attila_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Attila_Hallo_Condition ()
{	
	if (MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Attila_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Attila_Hallo_09_00"); //Ach - nareszcie. Czeka³em na ciebie, nieznajomy.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Czego ode mnie chcesz?",DIA_Attila_Hallo_Was);
	Info_AddChoice		(DIA_Attila_Hallo,"Kim jesteœ?",DIA_Attila_Hallo_Wer);
	
	B_GivePlayerXP (XP_Attila_MetHim);
};
FUNC VOID DIA_Attila_Hallo_Wer()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Nazywaj¹ mnie Attila... Ale czy to wa¿ne? Nasze imiona nie maj¹ znaczenia.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Sam to powinieneœ najlepiej wiedzieæ, nieznajomy.
	
	Knows_Attila_Wer = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Czego ode mnie chcesz?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice		(DIA_Attila_Hallo,"Co to za przedstawienie?",DIA_Attila_Hallo_Theater);
}; 
FUNC VOID DIA_Attila_Hallo_Was()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Was_15_00"); //Czego ode mnie chcesz?
	AI_Output (self, other, "DIA_Attila_Hallo_Was_09_01"); //Jestem tu po to, ¿eby ci wyjaœniæ kilka spraw. A potem ciê zabijê.
	Knows_Attila_Was = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Kim jesteœ?",DIA_Attila_Hallo_Wer);
	};
		Info_AddChoice		(DIA_Attila_Hallo,"Kto ci za to zap³aci³?",DIA_Attila_Hallo_Auftrag);
		Info_AddChoice		(DIA_Attila_Hallo,"Co to za przedstawienie?",DIA_Attila_Hallo_Theater);
};
FUNC VOID DIA_Attila_Hallo_Theater()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Theater_15_00"); //Co to za przedstawienie?
	AI_Output (self, other, "DIA_Attila_Hallo_Theater_09_01"); //U kresu swojej podró¿y powinieneœ umrzeæ, wiedz¹c dlaczego. Uznaj to za ostatni wyraz szacunku dla skazañca.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Pójdê ju¿ sobie (KONIEC)",DIA_Attila_Hallo_Ende);
	Info_AddChoice		(DIA_Attila_Hallo,"Kto ci za to zap³aci³?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Czemu chcesz mnie zabiæ?",DIA_Attila_Hallo_Warum);
	
};
FUNC VOID DIA_Attila_Hallo_Ende()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Ende_15_00"); //Zamierzam st¹d teraz wyjœæ...
	AI_Output (self, other, "DIA_Attila_Hallo_Ende_09_01"); //Obawiam siê... ¯e nie mogê na to pozwoliæ. PogódŸ siê z tym. Czas umieraæ.
	AI_DrawWeapon (self);
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Kto ci za to zap³aci³?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Czemu chcesz mnie zabiæ?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Auftrag()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //Kto ci za to zap³aci³?
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //Moi zleceniodawcy wol¹ unikaæ rozg³osu. I ja tak¿e.
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //Mój kontrakt stwierdza, ¿e nie wolno mi zdradziæ ich imion ani miejsca pobytu.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Czemu chcesz mnie zabiæ?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Warum()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Warum_15_00"); //Czemu chcesz mnie zabiæ?
	
	if (Betrayal_Halvor == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_01"); //Œci¹gn¹³eœ uwagê na Halvora. Teraz on siedzi w wiêzieniu. Tego nie by³o w planie.
	}; 
	if (Rengaru_InKnast == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_02"); //Sprzeda³eœ Rengara stra¿nikom miejskim. To tylko drobny z³odziej, ale nie powinieneœ by³ tego robiæ.
	};
	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_03"); //Przez ciebie Nagur wyl¹dowa³ za kratami. Pewni ludzie uznali to za twój niewybaczalny b³¹d.
	};
	
	AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_04"); //Moi zleceniodawcy nie s¹ z tego zadowoleni. I wys³ali mnie, aby uniemo¿liwiæ ci pope³nienie dalszych b³êdów.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Mogê ci daæ z³oto...",DIA_Attila_Hallo_Gold);
	Info_AddChoice		(DIA_Attila_Hallo,"Pozwól mi przynajmniej wyci¹gn¹æ broñ.",DIA_Attila_Hallo_Attacke);
	
};
FUNC VOID DIA_Attila_Hallo_Gold()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Gold_15_00"); //Mogê daæ ci z³oto... Du¿o z³ota.
	AI_Output (self, other, "DIA_Attila_Hallo_Gold_09_01"); //Nic z tego. Nie po to tu przyszed³em. Jedyna cena, jak¹ zap³acisz, to twoje ¿ycie. W³aœnie teraz.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};
FUNC VOID DIA_Attila_Hallo_Attacke()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Attacke_15_00"); //Pozwól mi przynajmniej wyci¹gn¹æ broñ.
	if (Npc_HasEquippedWeapon (other) == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_01"); //Dobrze, a wiêc przygotuj siê do swej ostatniej walki.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_02"); //Przecie¿ nie masz ¿adnej przy pasie. Zosta³o ci niewiele czasu, nieznajomy. Œmieræ na ciebie czeka.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 2);	
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Willkommen Schlüssel für die Diebesgilde 
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Willkommen  	(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Willkommen_Condition;
	information	 = 	DIA_Attila_Willkommen_Info;
	permanent	 =	FALSE;					
	important    = 	TRUE;
};

func int DIA_Attila_Willkommen_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
	&& (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info ()
{
	AI_Output (self, other, "DIA_Attila_Willkommen_09_00"); //Ach - nareszcie. Czeka³em na ciebie, nieznajomy.
	B_GivePlayerXP (XP_Attila_Friend);
	AI_Output (other, self, "DIA_Attila_Willkommen_15_01"); //Kim jesteœ? I czego ode mnie chcesz?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_02"); //To nieistotne. Wa¿ne jest to, co zrobi³eœ. Pozosta³eœ lojalny - nawet jeœli nie zdawa³eœ sobie z tego sprawy.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_03"); //Pewni dobroczyñcy zwrócili uwagê na twoj¹ lojalnoœæ. I zaoferowali ci szansê. Wiêc lepiej j¹ wykorzystaj.
	AI_Output (other, self, "DIA_Attila_Willkommen_15_04"); //Hej, powiedz mi tylko, czemu tu jesteœ...
	AI_Output (self, other, "DIA_Attila_Willkommen_09_05"); //Mam dla ciebie prezent. Reszta zale¿y od ciebie, nieznajomy.
	
	B_GiveInvItems (self,other,ItKe_ThiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "AFTER");
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_NachSchluessel		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_NachSchluessel_Condition;
	information	 = 	DIA_Attila_NachSchluessel_Info;
	permanent	 =	TRUE;					
	important    = 	TRUE;
};

func int DIA_Attila_NachSchluessel_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Wer))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info ()
{
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_00"); //Moje zadanie wykonane - na razie.
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_01"); //Ale kto wie, mo¿e nasze drogi jeszcze siê kiedyœ skrzy¿uj¹...
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe Wer bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Wer		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Wer_Condition;
	information	 = 	DIA_Attila_Wer_Info;
	permanent	 =	FALSE;					
	description	 =  "Kim jesteœ?";
};

func int DIA_Attila_Wer_Condition ()
{
	if Npc_KnowsInfo(other, DIA_Attila_Willkommen)
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info ()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Nazywaj¹ mnie Attila... Ale czy to wa¿ne? Nasze imiona nie maj¹ znaczenia.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Sam to powinieneœ najlepiej wiedzieæ, nieznajomy.
	
	AI_StopProcessInfos (self);
};






