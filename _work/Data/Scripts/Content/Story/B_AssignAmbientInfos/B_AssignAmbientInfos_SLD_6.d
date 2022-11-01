// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_6_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_6_EXIT_Condition;
	information	= DIA_SLD_6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_6_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_6_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_6_JOIN_Condition;
	information	= DIA_SLD_6_JOIN_Info;
	permanent	= TRUE;
	description = "Rád bych se k vám přidal!";
};                       

FUNC INT DIA_SLD_6_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //Rád bych se k vám přidal!
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //Slyšel jsem o té záležitosti s domobranou. Torlof říkal, že jsi prošel zkouškou. Máš můj souhlas.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //Oškubat farmáře je jedna věc, ale začínat si nepříjemnosti s domobranou je věc druhá. Ale jestli tě Onar bude k něčemu potřebovat, nejsem proti.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Promluv si s Torlofem. On už ti ukáže. (smích)
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_6_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_6_PEOPLE_Condition;
	information	= DIA_SLD_6_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_SLD_6_PEOPLE_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //Ta farma patří Onarovi, pokud ses ptal na tohle. Ale velí tady Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Býval generálem královského vojska. Ale teď už se s králem nějak nekamarádí. (smích)
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Pamatuj si jeho jméno. Když se tu dostaneš do potíží, bude nejspíš tím jediným, kdo to může urovnat. Všichni ostatní tě jednoduše stáhnou z kůže.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_6_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_6_LOCATION_Condition;
	information	= DIA_SLD_6_LOCATION_Info;
	permanent	= TRUE;
	description = "Hlídáte sedláky?";
};                       

FUNC INT DIA_SLD_6_LOCATION_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_6_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //Hlídáte farmáře?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Nehlídáme jen Onarovu farmu, ale celé tohle údolí.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar chce, abychom dali za vyučenou každému, kdo tu bude dělat potíže. Tak si dávej pozor.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_6_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_6_STANDARD_Condition;
	information	= DIA_SLD_6_STANDARD_Info;
	permanent	= TRUE;
	description = "Jak to jde?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //Co se stalo?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //Teď jsi jedním z nás, hochu!
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //Co chceš?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Když jsem to slyšel o těch dracích, nemohl jsem tomu vůbec uvěřit.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Drak - tak tomuhle říkám boj. Už žádné ovce a natvrdlá domobrana, ale konečně opravdový nepřítel.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //Fajn, nenadělal si ten tvůj lord Hagen z těch draků do kalhot?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //Tak to vypadá, že teď bude muset ten svůj nóbl zadek přece jen vytáhnout z města.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Lord Hagen může mluvit o štěstí. Ještě pár dní a přišli bychom si tam pro Benneta sami.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //Jestli brzy nepustí Benneta z vězení, dojdeme si pro něj sami.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //Co tady ještě děláš? Proč jsi nešel s ostatními do údolí?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Pro mě za mě, nikdo z vás se už nemusí vrátit.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //Měl by ses vydat do Hornického údolí. Slyšel jsem, že ti mizerní bastardi budou potřebovat každou pomoc.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //Hned, jak jsi přišel, jsem věděl, že to tu obrátíš vzhůru nohama.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Ale draci? To je něco jiného. Teď se tě jen tak někdo napadnout neodváží.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //Překvapils mě. Patříš ke špatné straně, ale zabít draka je rozhodně velký čin.
		};	
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_6 (var c_NPC slf)
{
	DIA_SLD_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_6_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_6_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
