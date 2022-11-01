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
	description = "Chcę się do was przyłączyć!";
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
	AI_Output (other, self, "DIA_SLD_6_JOIN_15_00"); //Chcę się do was przyłączyć.
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_01"); //Słyszałem o sprawie ze strażą. Torlof powiada, że zdałeś test. Możesz liczyć na mój głos.
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_02"); //Ograbianie chłopów to jedno, ale potyczki z regularnymi oddziałami straży to zupełnie inna sprawa. Cóż, jeśli Onar uważa, że się nadajesz, to ja nie będę się sprzeciwiał.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_6_JOIN_06_03"); //Pogadaj z Torlofem. On ci dopiero pokaże...
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
	description = "Kto tu dowodzi?";
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
	AI_Output (other, self, "DIA_SLD_6_PEOPLE_15_00"); //Kto tu rządzi?
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_01"); //Farma należy do Onara, jeśli o to ci chodzi. Jednak naszym przywódcą jest Lee.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_02"); //Swego czasu był generałem armii królewskiej. Jednak chyba nie lubią się już z królem.
	AI_Output (self, other, "DIA_SLD_6_PEOPLE_06_03"); //Zapamiętaj jego imię. Jeśli wpadniesz w jakieś tarapaty, tylko on będzie mógł uratować twój tyłek. Każdy inny po prostu poderżnie ci gardło.
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
	description = "Czy chronicie farmerów?";
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
	AI_Output (other, self, "DIA_SLD_6_LOCATION_15_00"); //Czy chronicie farmerów?
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_01"); //Chronimy nie tylko farmę Onara, ale i całą dolinę.
	AI_Output (self, other, "DIA_SLD_6_LOCATION_06_02"); //Onar chce, byśmy zajęli się każdym, kto sprawia kłopoty. Uważaj więc na siebie.
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
	description = "Co słychać?";
};                       
func INT DIA_SLD_6_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_6_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_6_STANDARD_15_00"); //Co słychać?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_01"); //Teraz, dzieciaku, jesteś jednym z nas.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_02"); //Czego chcesz?
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_03"); //Kiedy pierwszy raz usłyszałem o smokach, nie mogłem w to uwierzyć.
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_04"); //Smok - to dopiero przeciwnik, nie jakieś owce czy głupkowaci strażnicy. To prawdziwe wyzwanie.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_05"); //I co, jak tam ten twój Lord Hagen? Posrał się już w gacie ze strachu przed smokami?
				AI_Output (self,other,"DIA_SLD_6_STANDARD_06_06"); //Wygląda na to, że w końcu będzie musiał ruszyć swoje szanowne dupsko z miasta.
			};
		};	
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_07"); //Lord Hagen ma szczęście. Jeszcze kilka dni, a sami odbilibyśmy Benneta.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_08"); //Jeśli w ciągu kilku dni nie wypuszczą Benneta z więzienia, sami po niego pójdziemy.
		};	
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_09"); //Co tu jeszcze robisz? Nie wybierałeś się przypadkiem z innymi do Doliny?
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_10"); //Jeśli o mnie chodzi, to nie musicie wracać.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_11"); //Powinieneś iść do Górniczej Doliny. Słyszałem, że te biedne psubraty same sobie nie poradzą.
		};	
	};
	
	if (Kapitel >= 5)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_12"); //Kiedy tylko się pojawiłeś - wiedziałem, że wywrócisz to miejsce do góry nogami.
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_13"); //Ale smoki? No, to już coś. W najbliższym czasie nikt nie odważy się skrzyżować z tobą miecza.
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_6_STANDARD_06_14"); //Jestem pod wrażeniem. Nie walczymy po tej samej stronie, ale zabicie smoków to nie lada wyczyn.
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
