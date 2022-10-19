// *************************************************************************
// 									EXIT
// *************************************************************************
INSTANCE DIA_SLD_7_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_SLD_7_EXIT_Condition;
	information	= DIA_SLD_7_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_7_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
INSTANCE DIA_SLD_7_JOIN(C_INFO)
{
	nr			= 4;
	condition	= DIA_SLD_7_JOIN_Condition;
	information	= DIA_SLD_7_JOIN_Info;
	permanent	= TRUE;
	description = "Rád bych se k vám pâidal!";
};                       

FUNC INT DIA_SLD_7_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_SLD_7_JOIN_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Rád bych se k vám pâidal!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Slyšel jsem, žes to nandal domobranê. Nêkdo jako ty se nám tu mùže jen hodit!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Nedokážu si pâedstavit, co je na vybírání daní od nêkolika farmáâù tak složitého, ale když si to Onar pâeje, já nebudu proti.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Hned jak tê Torlof podrobí zkoušce, budeš hotovej, ty bimbasi!
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
INSTANCE DIA_SLD_7_PEOPLE(C_INFO)
{
	nr			= 3;
	condition	= DIA_SLD_7_PEOPLE_Condition;
	information	= DIA_SLD_7_PEOPLE_Info;
	permanent	= TRUE;
	description = "Kdo tady tomu velí?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Kdo tady tomu velí?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee je náš šéf. Torlof je jeho pravá ruka. Vêtšina lidí ho poslouchá, protože jim velel ještê v kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //A pak je tu Sylvio. Pâišel z hor potom, co sem dorazil Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On se svými lidmi pâedstavuje jen malou skupinku žoldnéâù - a dêlají jen samé problémy. Jedou na vlastní pêst.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //A Sylvio je mizernej zkurvysyn - dej si na nêj bacha.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
INSTANCE DIA_SLD_7_LOCATION(C_INFO)
{
	nr			= 2;
	condition	= DIA_SLD_7_LOCATION_Condition;
	information	= DIA_SLD_7_LOCATION_Info;
	permanent	= TRUE;
	description = "Povêz mi nêco o tomhle statku.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Âekni mi nêco o farmê.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar si nás najal, abychom bránili jeho majetek.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Tak si radêj poâádnê rozmysli, než budeš chtít nêco ukrást nebo napadnout farmáâe. Jinak si to budeš muset nejdâív vyâíkat s námi.
	};
};

// *************************************************************************
// 									NEWS
// *************************************************************************
INSTANCE DIA_SLD_7_STANDARD(C_INFO)
{
	nr			= 1;
	condition	= DIA_SLD_7_STANDARD_Condition;
	information	= DIA_SLD_7_STANDARD_Info;
	permanent	= TRUE;
	description = "Co je nového?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Co je nového?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od tý doby, co ses k nám pâidal, je tu klid - žádná domobrana.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Nic moc, alespoà tady. Ale zeptej se ve mêstê, mám dojem, že jim došel dlabanec. (smích)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Draci v Hornickém údolí! Nechtêl bych teë být v kùži paladinù.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Hádám, že král lordu Hagenovi asi nakope zadek, když se mu kvùli drakùm vrátí s prázdnejma rukama.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Tvoji paladinové si nevêdí s draky rady? Takoví kašpaâi - boj je práce pro opravdový chlapy.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //V té vêci s Bennetem ses zachoval víc než férovê. Sylvio se teë mùže vzteknout. Nejradši by vrazil do mêsta a rozmlátil to tam na kousky.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Vždycky chtêl Leeho zatlaèit do kouta, a Bennet se mu výbornê hodil.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nevím, proè jsi pomohl Bennetovi, ale vêâ mi, že pro mêsto je to tak lepší.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta vêc s Bennetem je smùla. Možná jsme pâece jen mêli Sylvia poslechnout a napadnout mêsto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Co máš v plánu s Bennetem? Jasnê, já to vlastnê radši ani nechci vêdêt. Už brzy ti dojde, k èemu to povede.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Mêl jsem dojem, žes mêl taky namíâeno do údolí. Spoleènê se Sylviem.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikdo z nás nechce ani pomyslet na to, že by Sylvio zùstal v údolí. Nikdy!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //To je od tebe docela odvaha, ukázat se tady úplnê sám.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale dokud se nebudeš pokoušet vybírat žádné danê, je mi to jedno.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Hochu, už to nemùžu dýl vydržet. Ovce, pastviny a stromy. Chci se odsud dostat.
	};
};


// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SLD_7 (var c_NPC slf)
{
	DIA_SLD_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_JOIN.npc					= Hlp_GetInstanceID(slf);
	DIA_SLD_7_PEOPLE.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_LOCATION.npc				= Hlp_GetInstanceID(slf);
	DIA_SLD_7_STANDARD.npc				= Hlp_GetInstanceID(slf);
};
