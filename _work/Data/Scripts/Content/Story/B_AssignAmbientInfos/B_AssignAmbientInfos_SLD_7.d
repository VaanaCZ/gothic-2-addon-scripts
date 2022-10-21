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
	description = "Rád bych se k vám pøidal!";
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
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Rád bych se k vám pøidal!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Slyšel jsem, žes to nandal domobranì. Nìkdo jako ty se nám tu mùže jen hodit!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Nedokážu si pøedstavit, co je na vybírání daní od nìkolika farmáøù tak složitého, ale když si to Onar pøeje, já nebudu proti.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Ty? Hned jak tì Torlof podrobí zkoušce, budeš hotovej, ty bimbasi!
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
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee je náš šéf. Torlof je jeho pravá ruka. Vìtšina lidí ho poslouchá, protože jim velel ještì v kolonii.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //A pak je tu Sylvio. Pøišel z hor potom, co sem dorazil Lee.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //On se svými lidmi pøedstavuje jen malou skupinku žoldnéøù - a dìlají jen samé problémy. Jedou na vlastní pìst.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //A Sylvio je mizernej zkurvysyn - dej si na nìj bacha.
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
	description = "Povìz mi nìco o tomhle statku.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Øekni mi nìco o farmì.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar si nás najal, abychom bránili jeho majetek.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Tak si radìj poøádnì rozmysli, než budeš chtít nìco ukrást nebo napadnout farmáøe. Jinak si to budeš muset nejdøív vyøíkat s námi.
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
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Od tý doby, co ses k nám pøidal, je tu klid - žádná domobrana.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Nic moc, alespoò tady. Ale zeptej se ve mìstì, mám dojem, že jim došel dlabanec. (smích)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Draci v Hornickém údolí! Nechtìl bych teï být v kùži paladinù.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Hádám, že král lordu Hagenovi asi nakope zadek, když se mu kvùli drakùm vrátí s prázdnejma rukama.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Tvoji paladinové si nevìdí s draky rady? Takoví kašpaøi - boj je práce pro opravdový chlapy.
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
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //V té vìci s Bennetem ses zachoval víc než férovì. Sylvio se teï mùže vzteknout. Nejradši by vrazil do mìsta a rozmlátil to tam na kousky.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Vždycky chtìl Leeho zatlaèit do kouta, a Bennet se mu výbornì hodil.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Nevím, proè jsi pomohl Bennetovi, ale vìø mi, že pro mìsto je to tak lepší.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Ta vìc s Bennetem je smùla. Možná jsme pøece jen mìli Sylvia poslechnout a napadnout mìsto.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Co máš v plánu s Bennetem? Jasnì, já to vlastnì radši ani nechci vìdìt. Už brzy ti dojde, k èemu to povede.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Mìl jsem dojem, žes mìl taky namíøeno do údolí. Spoleènì se Sylviem.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Nikdo z nás nechce ani pomyslet na to, že by Sylvio zùstal v údolí. Nikdy!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //To je od tebe docela odvaha, ukázat se tady úplnì sám.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Ale dokud se nebudeš pokoušet vybírat žádné danì, je mi to jedno.
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
