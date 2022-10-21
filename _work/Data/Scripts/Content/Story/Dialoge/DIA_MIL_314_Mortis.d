///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mortis_EXIT   (C_INFO)
{
	npc         = Mil_314_Mortis;
	nr          = 999;
	condition   = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Hallo_Condition;
	information	 = 	DIA_Mortis_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Mortis_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Mortis_Hallo_13_00"); //Czego chcesz? Pecka tu nie ma, wi�c nic nie wsk�rasz. Przyjd� p�niej.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Waffe_Condition;
	information	 = 	DIA_Mortis_Waffe_Info;
	permanent    =  FALSE;
	description  =  "Gdzie jest Peck?";
};

func int DIA_Mortis_Waffe_Condition ()
{	
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo (other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};
func void DIA_Mortis_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Waffe_15_00"); //Gdzie jest Peck?
	AI_Output (self, other, "DIA_Mortis_Waffe_13_01"); //W�a�nie si� do nas przy��czy�e�, prawda? A zatem witam w dru�ynie.
	AI_Output (self, other, "DIA_Mortis_Waffe_13_02"); //Peck strasznie d�ugo zabawi� w mie�cie. Za�o�� si�, �e ma spotkanie z t� s�odk� Vanj� z Czerwonej Latarni.
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Paket_Condition;
	information	 = 	DIA_Mortis_Paket_Info;
	permanent    =  FALSE;
	description  =  "Co wiesz na temat pewnej paczki z zielem?";
};

func int DIA_Mortis_Paket_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Paket_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Paket_15_00"); //Co wiesz na temat pewnej paczki z zielem?
	AI_Output (self, other, "DIA_Mortis_Paket_13_01"); //Hmmm... Ostatnio s�ysza�em w tawernie portowej, jak Kardif rozmawia� o niej z jakim� innym m�czyzn�.
	AI_Output (other, self, "DIA_Mortis_Paket_15_02"); //Kim by� ten drugi?
	AI_Output (self, other, "DIA_Mortis_Paket_13_03"); //Nie mam poj�cia. Powiedzia� tylko, �e znalaz� najlepsz� mo�liw� kryj�wk� na ziele - a potem obaj zacz�li si� �mia� niczym pijani orkowie.
	
	B_LogEntry (TOPIC_WAREHOUSE,"Mortis pods�ucha� w portowej knajpie rozmow� Kardifa z jakim� innym m�czyzn�. Zastanawiali si�, gdzie ukry� paczk�.");
};
///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  2;
	condition	 = 	DIA_Mortis_Redlight_Condition;
	information	 = 	DIA_Mortis_Redlight_Info;
	permanent    =  FALSE;
	description  =  "Co mo�esz mi powiedzie� o dzielnicy portowej?";
};

func int DIA_Mortis_Redlight_Condition ()
{	
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Mortis_Redlight_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Redlight_15_00"); //Co wiesz na temat dzielnicy portowej? Musz� dotrze� do cz�owieka, kt�ry sprzedaje ziele bagienne.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_01"); //Widzisz, ci faceci na dole nie s� specjalnie gadatliwi, a ju� na pewno nie powiedz� nic stra�nikowi miejskiemu.
	AI_Output (self, other, "DIA_Mortis_Redlight_13_02"); //Je�li chcesz si� czego� dowiedzie� tam na dole, to musisz zdj�� zbroj�.
	AI_Output (other, self, "DIA_Mortis_Redlight_15_03"); //No dobrze, a potem?
	AI_Output (self, other, "DIA_Mortis_Redlight_13_04"); //Tawerna i burdel to dwa miejsca, gdzie mo�esz zdoby� informacje. Innymi s�owy, je�li w og�le zdo�asz si� czego� dowiedzie�, to w�a�nie tam.
	
	B_LogEntry (TOPIC_REDLIGHT,"Mortis uwa�a, �e je�li chc� kupi� bagienne ziele w dzielnicy portowej, powinienem si� tam uda� bez zbroi. Najlepiej zacz�� poszukiwania od tawerny lub burdelu.");
};
///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach		(C_INFO)
{
	npc		 	 = 	Mil_314_Mortis;
	nr			 =  5;
	condition	 = 	DIA_Mortis_CanTeach_Condition;
	information	 = 	DIA_Mortis_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Chc� by� silniejszy.";
};

func int DIA_Mortis_CanTeach_Condition ()
{	
	if (Mortis_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Mortis_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_CanTeach_15_00"); //Chc� by� silniejszy.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_01"); //Je�li zdob�dziesz wystarczaj�co du�o do�wiadczenia, pomog� ci w treningu.
		Mortis_TeachSTR = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Mortis_CanTeach_13_02"); //Ale� oczywi�cie, kt� by nie chcia�. Niestety, dop�ki nie przy��czysz si� do nas albo do paladyn�w, nie mog� ci pom�c.
	};
	Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
	B_LogEntry (Topic_CityTeacher, "Mortis, stra�nik miejski, mo�e pokaza� mi kilka �wicze� zwi�kszaj�cych si��.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach		(C_INFO)
{
	npc		  	 = 	Mil_314_Mortis;
	nr			 = 	100;
	condition	 = 	DIA_Mortis_Teach_Condition;
	information	 = 	DIA_Mortis_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chc� by� silniejszy.";
};
func int DIA_Mortis_Teach_Condition ()
{	
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Mortis_Teach_Info ()
{
	AI_Output (other, self, "DIA_Mortis_Teach_15_00"); //Chc� by� silniejszy.
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
};
func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output (self, other, "DIA_Mortis_Teach_13_00"); //Ju� jeste� silny. Je�li potrzebujesz dalszego treningu, b�dziesz sobie musia� poszuka� innego nauczyciela.
	};
	Info_ClearChoices (DIA_Mortis_TEACH);
};
func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};
func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_LOW);
	
	Info_ClearChoices   (DIA_Mortis_Teach);
	
	Info_AddChoice 		(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))	,DIA_Mortis_Teach_1);
	Info_AddChoice		(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Mortis_Teach_5);
	
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mortis_PICKPOCKET (C_INFO)
{
	npc			= Mil_314_Mortis;
	nr			= 900;
	condition	= DIA_Mortis_PICKPOCKET_Condition;
	information	= DIA_Mortis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen (38, 60);
};
 
FUNC VOID DIA_Mortis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mortis_PICKPOCKET);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_BACK 		,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};
	
func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mortis_PICKPOCKET);
};


