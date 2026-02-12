<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin • Update Request</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>


        <style>
            body{background:#0a0c0e;color:white;font-family:Poppins,sans-serif;}
            .form-box{background:rgba(0,0,0,0.85);padding:2rem;border-radius:18px;width:500px;margin:auto;margin-top:80px;}
        </style>
    </head>
    <body>


        <div class="form-box">


            <h3>Update Request Status</h3>
            <hr/>


            <form action="EditRequestServlet.do" method="post">
                <label>Request ID</label>
                <input type="text" name="id" class="form-control mb-3" required/>


                <label>Status</label>
                <select name="status" class="form-control mb-3">
                    <option>Pending</option>
                    <option>Approved</option>
                    <option>Rejected</option>
                </select>


                <button class="btn btn-primary w-100">Update Status</button>


            </form>


        </div>


    </body>
</html>