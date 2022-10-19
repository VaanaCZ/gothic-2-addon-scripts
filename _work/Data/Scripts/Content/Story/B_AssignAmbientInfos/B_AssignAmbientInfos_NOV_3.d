// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_NOV_3_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_NOV_3_EXIT_Condition;
	information	= DIA_NOV_3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 		Fegen
// *************************************************************************
INSTANCE DIA_NOV_3_Fegen(C_INFO)
{
	nr			= 2;
	condition	= DIA_NOV_3_Fegen_Condition;
	information	= DIA_NOV_3_Fegen_Info;
	permanent	= TRUE;
	description = "Potâebuju pomoci zamést pokoje novicù.";
};                       
//------------------------------------
var int Feger1_Permanent; 
var int Feger2_Permanent;
//------------------------------------
FUNC INT DIA_NOV_3_Fegen_Condition()
{
	if (Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Fegen_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Potâebuji pomoci zamést pokoje novicù.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Nikdo ti nechce jen tak pomoct, co? Pomùžu ti jen v pâípadê, že se ti podaâí pâesvêdèit ještê nêkoho dalšího, aby do toho šel taky.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic, který uklízí sklep, mi nabídl pomocnou ruku, pokud nêkterého z jeho bratrù pâesvêdèím, aby mu pomohl zamést komnaty.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //To jsem jediný, kdo je ochotný ti pomoci?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Ne, už se mi podaâilo získat nêkoho dalšího.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Tak to jsem pro.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic ze sklepa mi nyní pomùže uklidit komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Hej, bratâe - já už ti pâece pomáhám. Nemusíš mê pâemlouvat.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Jasnê že ti pomùžu. My novicové musíme držet pâi sobê. Ruka ruku myje.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Potâebuju 50 zlatých, protože jsem stále ještê nezaplatil Parlanovi.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic pâed kostelem mi pomùže, pokud mu zaplatím padesát zlaãákù.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Možná pozdêji.",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Dobrá. Zaplatím.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Však už jsem ti to slíbil. Tys pomohl mnê, já pomùžu tobê.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Zapomeà na to - nemám na takové vêci èas. Podívej se po nêkom jiném, kdo by ti mohl pomoct.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Možná pozdêji. Právê teë si to nemùžu dovolit.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Dobrá. Zaplatím.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Fajn, v tom pâípadê mùžu zaèít.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Novic pâed kostelem mi nyní pomùže s úklidem komnat.");
	
	
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_NOV_3_Wurst(C_INFO)
{
	nr			= 3;
	condition	= DIA_NOV_3_Wurst_Condition;
	information	= DIA_NOV_3_Wurst_Info;
	permanent	= TRUE;
	description = "Nedal by sis klobásu?";
};                       

FUNC INT DIA_NOV_3_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_Wurst_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_Wurst_15_00"); //Nedal by sis klobásu?
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasnê, dej to sem. Taková klobása není vùbec k zahození.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_NOV_3_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_NOV_3_JOIN_Condition;
	information	= DIA_NOV_3_JOIN_Info;
	permanent	= TRUE;
	description = "Chci se stát mágem!";
};                       

FUNC INT DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

FUNC VOID DIA_NOV_3_JOIN_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_JOIN_15_00"); //Chci se stát mágem!
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //To chce každý novic. Ale jen nêkolika z nich je požehnáno být vyvoleným a dostat šanci na pâijetí do kruhu ohnê.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Být mágem kruhu ohnê je tou nejvyšší poctou, jaké se ti u nás mùže dostat.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Budeš muset tvrdê pracovat, abys dostal svou šanci.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_NOV_3_PEOPLE(C_INFO)
{
	nr			= 5;
	condition	= DIA_NOV_3_PEOPLE_Condition;
	information	= DIA_NOV_3_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo je pâedstaveným tohoto kláštera?";
};                       

FUNC INT DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_PEOPLE_15_00"); //Kdo je pâedstaveným tohoto kláštera?
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My novicové sloužíme mágùm kruhu ohnê. Ti se zodpovídají nejvyššímu shromáždêní, které sestává ze tâí nejmocnêjších èarodêjù.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Ale za vše, co se týká novicù, je zodpovêdný otec Parlan. Veškerý svùj èas tráví na nádvoâí, kde dohlíží na práci novicù.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_NOV_3_LOCATION(C_INFO)
{
	nr			= 6;
	condition	= DIA_NOV_3_LOCATION_Condition;
	information	= DIA_NOV_3_LOCATION_Info;
	permanent	= TRUE;
	description = "Co mi mùžeš âíct o tomto klášteru?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co mi mùžeš âíct o tomto klášteru?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Tady se staráme o to, abychom si zajistili své skromné zásoby. Chováme ovce a vyrábíme víno.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Tady je knihovna, ale mohou ji využívat pouze mágové a vyvolení novicové.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My novicové se do ní podíváme, jen když sem pro nêco jdeme mágùm kruhu ohnê.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_NOV_3_STANDARD(C_INFO)
{
	nr			= 10;
	condition	= DIA_NOV_3_STANDARD_Condition;
	information	= DIA_NOV_3_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_NOV_3_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Ty jsi zrovna ten pravý, co by se na to mêl ptát! O nièem jiném než o tobê novicové nemluví.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Jen málokdy se stane, že by se takový nováèek jako ty stal vyvoleným kruhu ohnê.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Èas znovu nadešel. Jeden z novicù bude brzy pâijat do kruhu ohnê.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Zkouška zaène už brzy.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Do našeho âádu pronikl Beliar! Zlo musí být velmi silné, když si dokázalo najít spojence už i tady.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro byl tady v klášteâe už celá léta. Dlouhý èas, který strávil venku, musel oslabit jeho víru, a tak snadno podlehl Beliarovu pokoušení.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Pâišel jsi právê vèas. Sám Innos by nemohl zvolit vhodnêjší dobu pro tvùj pâíchod.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Zapíšeš se do kroniky našeho kláštera jako mocný zachránce Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Zprávy z Hornického údolí jsou znepokojivé. Innos nás têžce zkouší.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Âíká se, že od paladinù, kteâí se vydali do Hornického údolí, zatím nedorazily žádné zprávy. Nejvyšší rada bude vêdêt, co má být uèinêno.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Âíkají, že bychom draky mêli znièit za pomoci našeho Pána. Beliarovy zrùdy stihne Innosùv hnêv.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Jen díky Innosovi se nám podaâilo zažehnat bezprostâední hrozbu. Musíme se vrátit na cestu našeho Pána, protože pouze s jeho pomocí se mùžeme postavit zlu.

	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_NOV_3 (var c_NPC slf)
{
	DIA_NOV_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc				= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc					= Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc					= Hlp_GetInstanceID(slf);
};
