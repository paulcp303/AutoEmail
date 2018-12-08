using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Sqlhelper 的摘要说明
/// </summary>
public class Sqlhelper
{
    public static string connectionString = ConfigurationManager.ConnectionStrings["Conn"].ConnectionString;

    #region 执行带参数的SQL语句

    #region ExecuteNonQuery
    /// <summary>
    /// 在指定的连接上用指定的参数执行SQL命令(不返回任何行)
    /// 一般用语执行执行 UPDATE、INSERT 或 DELETE 语句。
    /// </summary>
    /// <param name="connectionString">连接字符串</param>
    /// <param name="commandType">命令类型(存储过程、文本等等)</param>
    /// <param name="commandText">存储过程名或T-SQL语句</param>
    /// <returns>该命令影响的行数</returns>
    public static int ExecuteNonQuery(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (connectionString == null || connectionString.Length == 0)
            throw new ArgumentNullException("connectionString");
        if (commandText == null || commandText.Length == 0)
            throw new ArgumentNullException("commandText");

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            PrepareCommand(command, connection, commandType, commandText, commandParameters);
            int retval = command.ExecuteNonQuery();

            // connection.Close();
            //connection.Dispose();
            return retval;

        }
    }
    #endregion

    #region ExecuteReader
    /// <summary>
    /// 在指定的连接上用指定的参数执行SQL命令
    /// </summary>
    /// <param name="connectionString">连接字符串</param>
    /// <param name="commandType">命令类型(存储过程、文本等等)</param>
    /// <param name="commandText">存储过程名或T-SQL语句</param>
    /// <param name="commandParameters">命令的参数</param>
    /// <returns>返回一个SqlDataReader对象</returns>
    public static SqlDataReader ExecuteReader(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (connectionString == null || connectionString.Length == 0)
            throw new ArgumentNullException("connectionString");
        if (commandText == null || commandText.Length == 0)
            throw new ArgumentNullException("commandText");

        SqlConnection connection = null;
        try
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand();
            PrepareCommand(command, connection, commandType, commandText, commandParameters);
            SqlDataReader dataReader = command.ExecuteReader(CommandBehavior.CloseConnection);
            return dataReader;
        }
        catch
        {
            if (connection != null)
                connection.Close();
            //connection.Dispose();
            return null;
        }
    }

    #endregion

    #region 执行查询语句，返回DataSet
    /// <summary>
    /// 执行查询语句，返回DataSet
    /// </summary>
    /// <param name="SQLString">查询语句</param>
    /// <returns>DataSet</returns>
    public static DataSet Query(string sqlstr, params SqlParameter[] cmdParms)
    {
        SqlConnection con = new SqlConnection(connectionString);
        // 在此处编写执行Sql语句的返回DataSet的通用代码
        //FillDataSet(CommandType.Text, SQLString, ds, cmdParms);  //填充数据集
        //return ds;
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        cmd.CommandType = CommandType.Text;
        if (cmdParms != null)
        {
            foreach (SqlParameter item in cmdParms)
            {
                cmd.Parameters.Add(item);
            }
        }
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        con.Close();
        return ds;
    }
    #endregion

    #region ExecuteScalar
    /// <summary>
    /// 在指定的连接上用指定的参数执行SQL命令
    /// </summary>
    /// <param name="connectionString">连接字符串</param>
    /// <param name="commandType">命令类型(存储过程、文本等等)</param>
    /// <param name="commandText">存储过程名或T-SQL语句</param>
    /// <param name="commandParameters">命令的参数</param>
    /// <returns>返回一个单值</returns>
    public static object ExecuteScalar(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
    {
        if (connectionString == null || connectionString.Length == 0)
            throw new ArgumentNullException("connectionString");
        if (commandText == null || commandText.Length == 0)
            throw new ArgumentNullException("commandText");

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            PrepareCommand(command, connection, commandType, commandText, commandParameters);
            object obj = command.ExecuteScalar();
            //  connection.Close();
            //connection.Dispose();
            return obj;
        }
    }
    #endregion

    #region FillDataSet
    /// <summary>
    /// 填充数据集
    /// </summary>
    /// <param name="commandType">命令类型(存储过程、文本等等)</param>
    /// <param name="commandText">存储过程名或T-SQL语句</param>
    /// <param name="dataSet">要填充的数据集</param>
    /// <param name="tableNames">数据集中的表名</param>
    /// <param name="commandParameters">命令的参数</param>
    public static void FillDataSet(CommandType commandType,
        string commandText, DataSet dataSet, params SqlParameter[] commandParameters)
    {
        if (connectionString == null || connectionString.Length == 0)
            throw new ArgumentNullException("connectionString");
        if (commandText == null || commandText.Length == 0)
            throw new ArgumentNullException("commandText");
        if (dataSet == null)
            throw new ArgumentNullException("dataSet");

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            SqlCommand command = new SqlCommand();
            PrepareCommand(command, connection, commandType, commandText, commandParameters);

            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dataSet);
            //connection.Close();
            //connection.Dispose();
        }
    }
    #endregion

    #region UpdateDataSet
    /// <summary>
    /// 更新数据集
    /// </summary>
    /// <param name="insertCommand">插入命令对象</param>
    /// <param name="deleteCommand">删除命令对象</param>
    /// <param name="updateCommand">更新命令对象</param>
    /// <param name="dataSet">用作更新数据源的数据集</param>
    /// <param name="tableName">用作更新数据源的数据表</param>
    public static void UpdateDataSet(SqlCommand insertCommand, SqlCommand deleteCommand,
        SqlCommand updateCommand, DataSet dataSet, string tableName)
    {
        if (insertCommand == null) throw new ArgumentNullException("insertCommand");
        if (deleteCommand == null) throw new ArgumentNullException("deleteCommand");
        if (updateCommand == null) throw new ArgumentNullException("updateCommand");
        if (tableName == null || tableName.Length == 0) throw new ArgumentNullException("tableName");

        using (SqlDataAdapter dataAdapter = new SqlDataAdapter())
        {
            dataAdapter.UpdateCommand = updateCommand;
            dataAdapter.InsertCommand = insertCommand;
            dataAdapter.DeleteCommand = deleteCommand;

            dataAdapter.Update(dataSet, tableName);

            dataSet.AcceptChanges();
        }
    }
    #endregion

    #region PrepareCommand
    /// <summary>
    /// 设置Command对象的属性
    /// </summary>
    /// <param name="command">命令对象</param>
    /// <param name="connection">连接对象</param>
    /// <param name="commandType">命令类型(存储过程、文本等等)</param>
    /// <param name="commandText">存储过程名或T-SQL语句</param>
    /// <param name="commandParameters">命令的参数</param>
    private static void PrepareCommand(SqlCommand command, SqlConnection connection, CommandType commandType, string commandText, SqlParameter[] commandParameters)
    {
        if (command == null)
            throw new ArgumentNullException("command");
        if (connection == null)
            throw new ArgumentNullException("connection");
        if (commandText == null || commandText.Length == 0)
            throw new ArgumentNullException("commandText");

        command.Connection = connection;
        command.CommandType = commandType;
        command.CommandText = commandText;
        if (commandParameters != null)
            foreach (SqlParameter para in commandParameters)
                command.Parameters.Add(para);
    }
    #endregion

    #region ExeDelSqlTransaction
    /// <summary>
    /// 执行事务
    /// </summary>
    /// <param name="commandType"></param>
    /// <param name="paramsWhere">条件</param>
    /// <param name="sqlCommands">sql语句</param>
    public static bool ExeSqlTransaction(CommandType commandType, string sqlCommands, params SqlParameter[] paramsWhere)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            SqlTransaction st = conn.BeginTransaction();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = commandType;
            cmd.Connection = conn;
            cmd.Transaction = st;
            try
            {
                cmd.CommandText = sqlCommands;
                if (paramsWhere != null)
                    foreach (SqlParameter parameter in paramsWhere)
                    {
                        cmd.Parameters.Add(parameter);
                    }
                cmd.ExecuteNonQuery();
                st.Commit();      //提交事务
                return true;
            }
            catch
            {
                st.Rollback();  //回滚事务
                return false;
            }
        }
    }
    #endregion


    #region 返回数据表
    /// <summary>
    /// 返回数据表
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <param name="type"></param>
    /// <param name="pms"></param>
    /// <returns></returns>
    public static DataTable GetTable(string sqlstr, CommandType type, params SqlParameter[] pms)
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        cmd.CommandType = type;
        cmd.CommandTimeout = 100;
        if (pms != null)
        {
            foreach (SqlParameter item in pms)
            {
                cmd.Parameters.Add(item);
            }
        }
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds, "a");
        DataTable dt = ds.Tables["a"];
        con.Close();
        return dt;


    }
    public static DataTable GetTable(string sqlstr, CommandType type)
    {
        return GetTable(sqlstr, type, null);
    }

    /// <summary>
    /// 返回DataReader
    /// </summary>
    /// <param name="sqlstr">sql语句</param>
    /// <param name="type">类型</param>
    /// <param name="pms">参数</param>
    /// <returns></returns>
    public static SqlDataReader GetDataReader(string sqlstr, CommandType type, params SqlParameter[] pms)
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        cmd.CommandType = type;
        if (pms != null)
        {
            foreach (SqlParameter item in pms)
            {
                cmd.Parameters.Add(item);
            }
        }
        return cmd.ExecuteReader();
    }
    /// <summary>
    /// 返回datareader的重载
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <param name="type"></param>
    /// <returns></returns>
    public static SqlDataReader GetDataReader(string sqlstr, CommandType type)
    {
        return GetDataReader(sqlstr, type, null);
    }
    #endregion
    #endregion
    /// <summary>
    /// 返回dataset
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <param name="type"></param>
    /// <param name="pms"></param>
    /// <returns></returns>
    public static DataSet GetDataSet(string sqlstr, CommandType type, params SqlParameter[] pms)
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlstr, con);
        cmd.CommandType = type;
        if (pms != null)
        {
            foreach (SqlParameter item in pms)
            {
                cmd.Parameters.Add(item);
            }
        }
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        con.Close();
        return ds;
    }
    /// <summary>
    /// 返回dataset的重载
    /// </summary>
    /// <param name="sqlstr"></param>
    /// <param name="type"></param>
    /// <returns></returns>
    public static DataSet GetDataSet(string sqlstr, CommandType type)
    {
        return GetDataSet(sqlstr, type, null);
    }
}