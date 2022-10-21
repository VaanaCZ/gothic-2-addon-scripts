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
	description = "Ich will mich euch anschlie�en!";
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
	AI_Output (other, self, "DIA_SLD_7_JOIN_15_00"); //Ich will mich euch anschlie�en!
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_01"); //Ich hab geh�rt, du hast es den Milizen kr�ftig gegeben? Einen wie dich k�nnen wir hier gebrauchen!
	}
	else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_02"); //Die Pacht von ein paar Bauern einzutreiben, stell ich mir zwar nicht besonders schwierig vor, aber wenn Onar dich bezahlt, soll's mir Recht sein.
	}
	else
	{
		AI_Output (self, other, "DIA_SLD_7_JOIN_07_03"); //Du? Wenn Torlof dich auf die Probe stellt, kannst du einpacken, du Wurst!
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
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT DIA_SLD_7_PEOPLE_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_PEOPLE_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_01"); //Lee ist unser Anf�hrer. Torlof ist seine rechte Hand. Die meisten M�nner folgen ihm, denn er hat sie schon damals in der Kolonie angef�hrt.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_02"); //Und dann ist da noch Sylvio. Er ist mit seinen M�nnern aus den Bergen gekommen, nachdem Lee hier ankam.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_03"); //Er und seine Leute sind nur ein kleiner Teil der S�ldner - aber sie machen oft �rger. Die Typen kochen ihr eigenes S�ppchen.
	AI_Output (self, other, "DIA_SLD_7_PEOPLE_07_04"); //Und Sylvio ist 'ne linke Sau - also sei sch�n vorsichtig, wenn du ihn triffst.
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
	description = "Erz�hl mir was �ber den Hof.";
};                       

FUNC INT DIA_SLD_7_LOCATION_Condition()
{
	return TRUE;
};

FUNC VOID DIA_SLD_7_LOCATION_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_LOCATION_15_00"); //Erz�hl mir was �ber den Hof.
	AI_Output (self, other, "DIA_SLD_7_LOCATION_07_01"); //Onar hat uns angeheuert, damit wir sein Hab und Gut bewachen.
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_SLD_7_LOCATION_07_02"); //Also lass dir nicht einfallen, was zu stehlen oder die Bauern zu verpr�geln, sonst bekommst du �rger mit uns, klar?
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
	description = "Was gibt's Neues?";
};                       
func INT DIA_SLD_7_STANDARD_Condition()
{
	return TRUE;
};
FUNC VOID DIA_SLD_7_STANDARD_Info()
{	
	AI_Output (other, self, "DIA_SLD_7_STANDARD_15_00"); //Was gibt's Neues?
		
	if (Kapitel <= 2)
	{
		if (EnterOW_Kapitel2 == FALSE)
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_01"); //Seit du bei uns angefangen hast, ist auf dem Hof alles ruhig - keine Milizen.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_02"); //Hier bei uns nicht viel. Aber frag mal in der Stadt nach, ich glaube, die haben bald nichts mehr zu fressen. (lacht)
			};
		}
		else
		{
			if (other.guild == GIL_SLD)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_03"); //Drachen im Minental! In der Haut der Paladine m�chte ich jetzt nicht stecken.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_04"); //Sch�tze, der K�nig wird Lord Hagen einen kr�ftigen Arschtritt verpassen, wenn er wegen der Drachen mit leeren H�nden zur�ckkommt.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_05"); //Kommen eure Paladine mit den Drachen nicht zurecht? Kann ich mir vorstellen, k�mpfen ist halt doch was f�r echte M�nner.
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
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_06"); //Das mit Bennet war echt in Ordnung von dir. Sylvio kocht vor Wut. Er w�re am liebsten in die Stadt gest�rmt und h�tte alles kurz und klein geschlagen.
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_07"); //Er versucht st�ndig, Lee in die Defensive zu dr�ngen und Bennet war ein guter Anlass.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_08"); //Ich wei� ja nicht, warum du Bennet geholfen hast, aber glaub mir, es war besser f�r die Stadt.
			};
		}
		else
		{
			if (hero.guild == GIL_SLD)
			|| (hero.guild == GIL_DJG)
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_09"); //Das mit Bennet ist 'ne echt �ble Sache. Vielleicht sollten wir doch auf Sylvio h�ren und die Stadt angreifen.
			}
			else
			{
				AI_Output (self,other,"DIA_SLD_7_STANDARD_07_10"); //Was habt ihr mit Bennet vor. Ach, ich will es gar nicht wissen, ihr werdet schon sehen, wohin das f�hrt.
			};
		};		
	};

	if (Kapitel == 4)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_11"); //Ich dachte, du wolltest auch ins Tal. Zusammen mit Sylvio.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_12"); //Wir alle h�tten nichts dagegen, wenn Sylvio im Tal bliebe. F�R IMMER!
		}
		else
		{
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_13"); //Ganz sch�n mutig von dir, hier aufzutauchen, so ganz allein.
			AI_Output (self,other,"DIA_SLD_7_STANDARD_07_14"); //Aber mir soll's egal sein, solange du keine Steuern eintreiben willst.
		};
	};
	
	if (Kapitel >= 5)
	{
		AI_Output (self,other,"DIA_SLD_7_STANDARD_07_15"); //Junge, ich halte das hier nicht mehr aus. Schafe, Wiesen und B�ume. Ich will hier endlich verschwinden.
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
