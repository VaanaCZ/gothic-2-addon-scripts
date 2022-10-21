// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sld_820_EXIT(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_820_EXIT_Condition;
	information	= DIA_Sld_820_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Halt 
// ************************************************************

INSTANCE DIA_Sld_820_Halt (C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_Halt_Condition;
	information	= DIA_Sld_820_Halt_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Sld_820_Halt_Condition()
{
	if (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sld_820_Halt_Info()
{	
	AI_Output (self, other, "DIA_Sld_820_Halt_07_00"); //Wo willst du denn hin?
	AI_Output (other, self, "DIA_Sld_820_Halt_15_01"); //Na, ins Haus.
	AI_Output (self, other, "DIA_Sld_820_Halt_07_02"); //Onar bezahlt uns, damit wir Typen wie dich hier nicht reinlassen!

	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Sld_820_Halt_07_03"); //Das ihr mir hier keine Milizen reinlasst! - Das waren seine Worte.
	};

	AI_Output (other, self, "DIA_Sld_820_Halt_15_04"); //Ich will mit Lee reden!
	AI_Output (self, other, "DIA_Sld_820_Halt_07_05"); //Was willst du von ihm?
	
	Info_ClearChoices (DIA_Sld_820_Halt);
	Info_AddChoice (DIA_Sld_820_Halt, "Ich kenne ihn von früher...", DIA_Sld_820_Halt_KenneLee);
	if (other.guild == GIL_NONE)
	{
		Info_AddChoice (DIA_Sld_820_Halt, "Ich will mich den Söldnern anschliessen!", DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output (self, other, "B_Sld_820_LeeIsRight_07_00"); //Lee ist im rechten Flügel. Lass dir ja nicht einfallen, dich woanders rumzutreiben!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_WannaJoin_15_00"); //Ich will mich den Söldnern anschließen!
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_01"); //Ah, frisches Kanonenfutter! Dann geh mal rein.
	B_Sld_820_LeeIsRight();
	AI_Output (self, other, "DIA_Sld_820_Halt_WannaJoin_07_02"); //Aber vor allem lass Onar in Ruhe! Er steht nicht drauf, wenn man ihn unaufgefordert anquatscht. Schon gar nicht bei Typen wie dir.
	AI_StopProcessInfos	(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output (other, self, "DIA_Sld_820_Halt_KenneLee_15_00"); //Ich kenne ihn von früher ...
	AI_Output (self, other, "DIA_Sld_820_Halt_KenneLee_07_01"); //DU bist ein Kumpel von Lee? Ich glaub dir kein Wort! Aber geh ruhig, wenn er sich nicht an dich erinnern kann, wirst du's schon merken ... (lacht)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   PERM 
// ************************************************************

INSTANCE DIA_Sld_820_PERM(C_INFO)
{
	npc			= Sld_820_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_820_PERM_Condition;
	information	= DIA_Sld_820_PERM_Info;
	permanent	= TRUE;
	description = "Wie sieht's aus?";
};                       

FUNC INT DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sld_820_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sld_820_PERM_15_00"); //Wie sieht's aus?
	AI_Output (self, other, "DIA_Sld_820_PERM_07_01"); //Geh rein, wenn du willst, aber quatsch mich nicht voll.
	AI_StopProcessInfos	(self);
};










	
	
	
	


























