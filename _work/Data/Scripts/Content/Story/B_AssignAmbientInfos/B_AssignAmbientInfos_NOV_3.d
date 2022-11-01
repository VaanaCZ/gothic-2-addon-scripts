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
	description = "Potâebuju pomoci zamést pokoje noviců.";
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
	AI_Output (other, self, "DIA_NOV_3_Fegen_15_00"); //Potâebuji pomoci zamést pokoje noviců.
	
	//---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID (Feger1)  == Hlp_GetInstanceID (self))
	{
		if (NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_01"); //Nikdo ti nechce jen tak pomoct, co? Pomůžu ti jen v pâípadę, že se ti podaâí pâesvędčit ještę nękoho dalšího, aby do toho šel taky.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic, který uklízí sklep, mi nabídl pomocnou ruku, pokud nękterého z jeho bratrů pâesvędčím, aby mu pomohl zamést komnaty.");
		}
		else if  (NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE)
		{	
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_02"); //To jsem jediný, kdo je ochotný ti pomoci?
			AI_Output (other, self, "DIA_NOV_3_Fegen_15_03"); //Ne, už se mi podaâilo získat nękoho dalšího.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_04"); //Tak to jsem pro.
			NOV_Helfer = (NOV_Helfer +1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP (XP_Feger);
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine (self,"FEGEN");
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic ze sklepa mi nyní pomůže uklidit komnaty.");
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_05"); //Hej, bratâe - já už ti pâece pomáhám. Nemusíš mę pâemlouvat.
		};
	};
	//----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------
	
	if (Hlp_GetInstanceID (Feger2) ==  Hlp_GetInstanceID (self))
	{	
		if (Feger2_Permanent == FALSE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_08"); //Jasnę že ti pomůžu. My novicové musíme držet pâi sobę. Ruka ruku myje.
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_09"); //Potâebuju 50 zlatých, protože jsem stále ještę nezaplatil Parlanovi.
			
			B_LogEntry 	(Topic_ParlanFegen,"Novic pâed kostelem mi pomůže, pokud mu zaplatím padesát zlaăáků.");
			
			Info_ClearChoices  (DIA_NOV_3_Fegen);
			Info_AddChoice (DIA_NOV_3_Fegen,"Možná pozdęji.",DIA_NOV_3_Fegen_Nein);
			
			if (Npc_HasItems (other, ItMi_Gold) >= 50)
			{
				Info_AddChoice (DIA_NOV_3_Fegen,"Dobrá. Zaplatím.",DIA_NOV_3_Fegen_Ja);
			};
		}
		else //if (Feger2_Permanent == TRUE)
		{
			AI_Output (self, other, "DIA_NOV_3_Fegen_03_06"); //Však už jsem ti to slíbil. Tys pomohl mnę, já pomůžu tobę.
		};
	};	
		//------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------
		
	if (Hlp_GetInstanceID (Feger1) !=  Hlp_GetInstanceID (self)) 
	&& (Hlp_GetInstanceID (Feger2) !=  Hlp_GetInstanceID (self)) 
	{	
		AI_Output (self, other, "DIA_NOV_3_Fegen_03_07"); //Zapomeŕ na to - nemám na takové vęci čas. Podívej se po nękom jiném, kdo by ti mohl pomoct.
	};
};


FUNC VOID DIA_NOV_3_Fegen_Nein()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //Možná pozdęji. Právę teë si to nemůžu dovolit.
	Info_ClearChoices  (DIA_NOV_3_Fegen);
};
FUNC VOID DIA_NOV_3_Fegen_Ja()
{
	AI_Output (other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //Dobrá. Zaplatím.
	AI_Output (self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //Fajn, v tom pâípadę můžu začít.
	
	B_GiveInvItems (other,self,ItMi_Gold,50);
	NOV_Helfer = (NOV_Helfer +1);
	B_GivePlayerXP (XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices  (DIA_NOV_3_Fegen);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FEGEN");
	
	B_LogEntry 	(Topic_ParlanFegen,"Novic pâed kostelem mi nyní pomůže s úklidem komnat.");
	
	
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
	AI_Output (self, other, "DIA_NOV_3_Wurst_03_01"); //Jasnę, dej to sem. Taková klobása není vůbec k zahození.
	
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
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_01"); //To chce každý novic. Ale jen nękolika z nich je požehnáno být vyvoleným a dostat šanci na pâijetí do kruhu ohnę.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_02"); //Být mágem kruhu ohnę je tou nejvyšší poctou, jaké se ti u nás může dostat.
	AI_Output (self, other, "DIA_NOV_3_JOIN_03_03"); //Budeš muset tvrdę pracovat, abys dostal svou šanci.
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
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_01"); //My novicové sloužíme mágům kruhu ohnę. Ti se zodpovídají nejvyššímu shromáždęní, které sestává ze tâí nejmocnęjších čarodęjů.
	AI_Output (self, other, "DIA_NOV_3_PEOPLE_03_02"); //Ale za vše, co se týká noviců, je zodpovędný otec Parlan. Veškerý svůj čas tráví na nádvoâí, kde dohlíží na práci noviců.
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
	description = "Co mi můžeš âíct o tomto klášteru?";
};                       

FUNC INT DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_NOV_3_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_NOV_3_LOCATION_15_00"); //Co mi můžeš âíct o tomto klášteru?
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_01"); //Tady se staráme o to, abychom si zajistili své skromné zásoby. Chováme ovce a vyrábíme víno.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_02"); //Tady je knihovna, ale mohou ji využívat pouze mágové a vyvolení novicové.
	AI_Output (self, other, "DIA_NOV_3_LOCATION_03_03"); //My novicové se do ní podíváme, jen když sem pro nęco jdeme mágům kruhu ohnę.
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
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_01"); //Ty jsi zrovna ten pravý, co by se na to męl ptát! O ničem jiném než o tobę novicové nemluví.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_02"); //Jen málokdy se stane, že by se takový nováček jako ty stal vyvoleným kruhu ohnę.
		}
		else
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_03"); //Čas znovu nadešel. Jeden z noviců bude brzy pâijat do kruhu ohnę.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_04"); //Zkouška začne už brzy.
		};
	};

	if (Kapitel == 2)
	|| (Kapitel == 3)
	{
		if (Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)	//Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
	 		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_05"); //Do našeho âádu pronikl Beliar! Zlo musí být velmi silné, když si dokázalo najít spojence už i tady.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_06"); //Pedro byl tady v klášteâe už celá léta. Dlouhý čas, který strávil venku, musel oslabit jeho víru, a tak snadno podlehl Beliarovu pokoušení.
		}
		else if (MIS_NovizenChase == LOG_SUCCESS)	//Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_07"); //Pâišel jsi právę včas. Sám Innos by nemohl zvolit vhodnęjší dobu pro tvůj pâíchod.
			AI_Output (self,other,"DIA_NOV_3_STANDARD_03_08"); //Zapíšeš se do kroniky našeho kláštera jako mocný zachránce Oka.
		}
		else //Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_09"); //Zprávy z Hornického údolí jsou znepokojivé. Innos nás tęžce zkouší.
			}
			else
			{
				AI_Output (self,other,"DIA_NOV_3_STANDARD_03_10"); //Âíká se, že od paladinů, kteâí se vydali do Hornického údolí, zatím nedorazily žádné zprávy. Nejvyšší rada bude vędęt, co má být učinęno.
			};
		};	
	};

	if (Kapitel == 4)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_11"); //Âíkají, že bychom draky męli zničit za pomoci našeho Pána. Beliarovy zrůdy stihne Innosův hnęv.
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_NOV_3_STANDARD_03_12"); //Jen díky Innosovi se nám podaâilo zažehnat bezprostâední hrozbu. Musíme se vrátit na cestu našeho Pána, protože pouze s jeho pomocí se můžeme postavit zlu.

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
